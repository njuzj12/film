package com.film.action;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.film.model.Film;
import com.film.model.User;
import com.film.service.FilmService;
import com.film.vo.film.PlanVO;
import com.film.vo.user.HomeVO;

public class FilmAction {
	FilmService filmService;
	
	/*
	 * 首页
	 */
	public String home(){
		HttpServletRequest request = ServletActionContext.getRequest();    //获取request
		
		HomeVO homevo=filmService.fetchInfoFromHome();
		request.setAttribute("homevo", homevo);
		return "home";
	}

	/*
	 * 电影的具体介绍
	 */
	public String filmInfo(){
		HttpServletRequest request = ServletActionContext.getRequest();    //获取request
		String filmId=request.getParameter("film");
		if (filmId==null){
			return "home";
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
	
	public void setFilmService(FilmService filmService) {
		this.filmService = filmService;
	}
	
	/*
	 * 为制定计划添加电影
	 */
	public String filmToAdd(){
		HttpServletRequest request = ServletActionContext.getRequest();    //获取request
		ArrayList<Film> films=filmService.getAllFilms();
		request.setAttribute("films", films);
		return "filmToAdd";
	}
	
	/*
	 * 选座
	 */
	public String chooseSeat(){
		HttpServletRequest request = ServletActionContext.getRequest();    //获取request
		Integer userid;
		if ((userid=isLogined(request))==null){		//未登录
			return "notLogined";
		}
		String planId=request.getParameter("planId");
		
		if (planId==null){
			return "home";
		}
		PlanVO plan = filmService.getPlanById(userid,planId);
		
		if (plan==null){
			
			return "myAccount";
		}
		request.setAttribute("plan", plan);
		
		return "chooseSeat";
	}
	
	private Integer isLogined(HttpServletRequest request){
		HttpSession session = request.getSession();
		 Object sessionRes=session.getAttribute("userId");
		 if (sessionRes==null){
			 return null;
		 }
		 return (Integer)sessionRes;
	}
}
