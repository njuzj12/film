package com.film.action;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.film.model.Film;
import com.film.model.Recharge;
import com.film.model.User;
import com.film.service.FilmService;
import com.film.service.UserService;
import com.film.vo.film.PlanVO;
import com.film.vo.user.ConsumeRecordVO;
import com.film.vo.user.HomeVO;
import com.film.vo.waiter.MakePlanVO;

public class WaiterAction {
	FilmService filmService;
	UserService userService;
	
	public String logout(){
		HttpServletRequest request = ServletActionContext.getRequest();    //获取request
		request.getSession().invalidate();
		request.getSession(true);
		System.out.println("已清空session");
		return "login";
	}
	
	public String makePlan(){
		HttpServletRequest request = ServletActionContext.getRequest();    //获取request
		Integer waiterId;
		if ((waiterId=isLogined(request))==null){		//未登录
			return "login";
		}
		
		MakePlanVO makePlanVO=new MakePlanVO();
		makePlanVO=filmService.fetchInfoFromMakePlan();
		request.setAttribute("vo", makePlanVO);
		return "makePlan";
	}
	
	public String makeActivity(){
		HttpServletRequest request = ServletActionContext.getRequest();    //获取request
		Integer waiterId;
		if ((waiterId=isLogined(request))==null){		//未登录
			return "login";
		}
		
		ArrayList<Film> films=filmService.getAllFilms();
		request.setAttribute("films", films);
		return "makeActivity";
	}

	public void setFilmService(FilmService filmService) {
		this.filmService = filmService;
	}
	
	public String showUser(){
		HttpServletRequest request = ServletActionContext.getRequest();    //获取request
		Integer waiterId;
		if ((waiterId=isLogined(request))==null){		//未登录
			return "login";
		}
		String userId=request.getParameter("userId");
		if (userId==null){
			return "toAllUser";
		}
		User user=userService.getUserById(Integer.parseInt(userId));
		request.setAttribute("user",user);
		ArrayList<Recharge> recharges=userService.fetchRechargeRecord(Integer.parseInt(userId));
		request.setAttribute("recharges", recharges);
		ArrayList<ConsumeRecordVO> consumeRecordVOs=userService.fetchConsumeRecord(Integer.parseInt(userId));
		request.setAttribute("consumes", consumeRecordVOs);
		return "showUser";
	}
	
	public String allUser(){
		HttpServletRequest request = ServletActionContext.getRequest();    //获取request
		Integer waiterId;
		if ((waiterId=isLogined(request))==null){		//未登录
			return "login";
		}
		ArrayList<User> users=userService.getAllUser();
		request.setAttribute("users",users);
		return "allUser";
	}
	
	public String films(){
		HttpServletRequest request = ServletActionContext.getRequest();    //获取request
		Integer waiterId;
		if ((waiterId=isLogined(request))==null){		//未登录
			return "login";
		}
		HomeVO homevo=filmService.fetchInfoFromHome();
		request.setAttribute("homevo", homevo);
		return "films";
	}
	
	/*
	 * 电影的具体介绍
	 */
	public String filmInfo(){
		HttpServletRequest request = ServletActionContext.getRequest();    //获取request
		String filmId=request.getParameter("film");
		if (filmId==null){
			return "films";
		}
		Film film=filmService.fetchInfoFromfilmInfo(filmId);
		request.setAttribute("film", film);
		
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		Date date=new Date();
		String dateString=format.format(date);
		request.setAttribute("dateString",dateString);
		
		ArrayList<PlanVO> plans=filmService.fetchPlanInfoByTime(filmId,dateString);
		request.setAttribute("plans", plans);
		return "filmInfo";
	}
	
	/*
	 * 选座
	 */
	public String chooseSeat(){
		HttpServletRequest request = ServletActionContext.getRequest();    //获取request
		Integer waiterId;
		if ((waiterId=isLogined(request))==null){		//未登录
			return "notLogined";
		}
		String planId=request.getParameter("planId");
		
		if (planId==null){
			return "home";
		}
		PlanVO plan = filmService.getPlanByWaiter(waiterId,planId);
		
		if (plan==null){
			
			return "myAccount";
		}
		request.setAttribute("plan", plan);
		
		return "chooseSeat";
	}
	
	private Integer isLogined(HttpServletRequest request){
		HttpSession session = request.getSession();
		 Object sessionRes=session.getAttribute("waiterId");
		 if (sessionRes==null){
			 return null;
		 }
		 return (Integer)sessionRes;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	
	
}
