package com.film.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.film.service.FilmService;
import com.film.service.ManageService;
import com.film.vo.waiter.MakePlanVO;

public class ManageAction {
	FilmService filmService;
	ManageService manageService;
	
	public String logout(){
		HttpServletRequest request = ServletActionContext.getRequest();    //获取request
		request.getSession().invalidate();
		request.getSession(true);
		System.out.println("已清空session");
		return "login";
	}
	
	public String showPlan(){
		HttpServletRequest request = ServletActionContext.getRequest();    //获取request
		Integer manageId;
		if ((manageId=isLogined(request))==null){		//未登录
			return "login";
		}
		
		MakePlanVO makePlanVO=new MakePlanVO();
		makePlanVO=filmService.fetchInfoFromMakePlan();
		request.setAttribute("vo", makePlanVO);
		return "showPlan";
	}
	
	public String showCount(){
		HttpServletRequest request = ServletActionContext.getRequest();    //获取request
		Integer manageId;
		if ((manageId=isLogined(request))==null){		//未登录
			return "login";
		}
		int[] userAge=manageService.getUserAge();
		ArrayList<Integer> userStatus=manageService.getCard();
//		MakePlanVO makePlanVO=new MakePlanVO();
//		makePlanVO=filmService.fetchInfoFromMakePlan();
//		request.setAttribute("vo", makePlanVO);
		request.setAttribute("userAge", userAge);
		request.setAttribute("userStatus", userStatus);
		return "showCount";
	}
	
	public String showFilmCount(){
		HttpServletRequest request = ServletActionContext.getRequest();    //获取request
		Integer manageId;
		if ((manageId=isLogined(request))==null){		//未登录
			return "login";
		}
//		MakePlanVO makePlanVO=new MakePlanVO();
//		makePlanVO=filmService.fetchInfoFromMakePlan();
//		request.setAttribute("vo", makePlanVO);
		return "showFilmCount";
	}

	public void setFilmService(FilmService filmService) {
		this.filmService = filmService;
	}
	
	private Integer isLogined(HttpServletRequest request){
		HttpSession session = request.getSession();
		 Object sessionRes=session.getAttribute("manageId");
		 if (sessionRes==null){
			 return null;
		 }
		 return (Integer)sessionRes;
	}

	public void setManageService(ManageService manageService) {
		this.manageService = manageService;
	}
	
	
}
