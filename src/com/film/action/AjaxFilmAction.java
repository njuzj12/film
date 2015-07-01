package com.film.action;

import java.io.Serializable;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.film.model.Film;
import com.film.model.Plan;
import com.film.service.FilmService;
import com.film.service.UserService;
import com.film.vo.waiter.AjaxAddPlanVO;
import com.opensymphony.xwork2.ActionSupport;

public class AjaxFilmAction extends ActionSupport {

	private AjaxAddPlanVO vo;
	private String message;
	private ArrayList<Plan> plans;
	private ArrayList<Film> films;
	private Serializable bookId;
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	FilmService filmService;
	UserService userService;

	public String sendPlan() {
		HttpServletRequest request = ServletActionContext.getRequest(); // 获取request

		int roomId = Integer.parseInt(request.getParameter("roomId"));
		int timeId = Integer.parseInt(request.getParameter("timeId"));
		int filmId = Integer.parseInt(request.getParameter("filmId"));

		String playTime = request.getParameter("playTime");

		vo = filmService.addPlan(roomId, timeId, filmId, playTime);
		request.setAttribute("vo", vo);
		return "sendPlan";
	}

	public String accessPlan() {
		HttpServletRequest request = ServletActionContext.getRequest(); // 获取request

		int roomId = Integer.parseInt(request.getParameter("roomId"));
		int timeId = Integer.parseInt(request.getParameter("timeId"));

		String playTime = request.getParameter("playTime");

		vo = filmService.accessPlan(roomId, timeId, playTime);
		request.setAttribute("vo", vo);
		return "accessPlan";
	}

	public String removePlan() {
		HttpServletRequest request = ServletActionContext.getRequest(); // 获取request

		int roomId = Integer.parseInt(request.getParameter("roomId"));
		int timeId = Integer.parseInt(request.getParameter("timeId"));

		String playTime = request.getParameter("playTime");

		vo = filmService.removePlan(roomId, timeId, playTime);

		return "removePlan";
	}

	public String makeActivity() {
		HttpServletRequest request = ServletActionContext.getRequest(); // 获取request
		System.out.println("makeActivity()");
		int filmId = Integer.parseInt(request.getParameter("filmId"));
		String title = request.getParameter("title");
		String aAns = request.getParameter("aAns");
		String bAns = request.getParameter("bAns");
		String cAns = request.getParameter("cAns");
		message = filmService.addQuestion(filmId, title, aAns, bAns, cAns);
		return "makeActivity";
	}

	public String getTodayPlan() {
		HttpServletRequest request = ServletActionContext.getRequest(); // 获取request
		String playTime = request.getParameter("playTime");
		plans = filmService.getTodayFilms(playTime);
		films = new ArrayList<Film>();
		for (Plan plan : plans) {
			Film film = filmService.getFilmById(plan.getFilmId());
			films.add(film);
		}
		System.out.println("getTodayPlan" + plans.size());
		System.out.println("getTodayPlan" + films.size());
		return "getTodayPlan";
	}

	public String pay() {
		HttpServletRequest request = ServletActionContext.getRequest(); // 获取request
		Integer userid;
		if ((userid = isLogined(request)) == null) { // 未登录
			message = "failure";
		} else {
			String rowString = request.getParameter("row");
			String columnString = request.getParameter("column");
			String seatNum = request.getParameter("seatNum");
			String planId = request.getParameter("planId");
			if (planId == "") {
				message = "failure";
				return "pay";
			}
			String price = request.getParameter("price");
			bookId = userService.book(userid, planId, seatNum, rowString,
					columnString, price);
			message = "success";
		}
		return "pay";
	}

	public String waiterPay() {
		HttpServletRequest request = ServletActionContext.getRequest(); // 获取request
		String rowString = request.getParameter("row");
		String columnString = request.getParameter("column");
		String seatNum = request.getParameter("seatNum");
		String planId = request.getParameter("planId");
		if (planId == "") {
			message = "failure";
			return "waiterPay";
		}
		String price = request.getParameter("price");
		message = userService.waiterBuy(planId, seatNum, rowString,
				columnString, price);

		return "waiterPay";
	}

	public void setFilmService(FilmService filmService) {
		this.filmService = filmService;
	}

	public AjaxAddPlanVO getVo() {
		return vo;
	}

	public void setVo(AjaxAddPlanVO vo) {
		this.vo = vo;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public ArrayList<Plan> getPlans() {
		return plans;
	}

	public void setPlans(ArrayList<Plan> plans) {
		this.plans = plans;
	}

	public ArrayList<Film> getFilms() {
		return films;
	}

	public void setFilms(ArrayList<Film> films) {
		this.films = films;
	}

	public Serializable getBookId() {
		return bookId;
	}

	public void setBookId(Serializable bookId) {
		this.bookId = bookId;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	private Integer isLogined(HttpServletRequest request) {
		HttpSession session = request.getSession();
		Object sessionRes = session.getAttribute("userId");
		if (sessionRes == null) {
			return null;
		}
		return (Integer) sessionRes;
	}
}
