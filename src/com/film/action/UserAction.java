package com.film.action;


import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.film.model.Book;
import com.film.model.Recharge;
import com.film.model.User;
import com.film.service.UserService;
import com.film.vo.user.ActivityVO;
import com.film.vo.user.ConsumeRecordVO;
import com.film.vo.user.LoginVO;
import com.film.vo.user.RechargingVO;

public class UserAction {
	private UserService userService;
	/*
     * Action的默认执行方法
     */
	public String execute(){  
		return null;
	}
	
	/*
	 * 处理注册
	 */
	public String register(){
		HttpServletRequest request = ServletActionContext.getRequest();    //获取request
		String name=request.getParameter("name");
		String password=request.getParameter("password");
		int result=userService.register(name,password);
		if (result!=-1){
			request.setAttribute("userId", result);
			request.getSession().setAttribute("loged", 1);
			request.getSession().setAttribute("userId", result);
			request.getSession().setAttribute("name", name);
			return "registerSuccess";
		} else {
			return "registerFail";
		}
	}

	/*
	 * 处理登陆
	 */
	public String login(){
		HttpServletRequest request = ServletActionContext.getRequest();    //获取request
		String userId=request.getParameter("userId");
		String password=request.getParameter("password");
		LoginVO loginVO=userService.qualify(userId,password);
		if (loginVO.isSuccess()){
			//得到界面来源
//			String url = request.getHeader("referer");
//			String context = request.getContextPath();
//			String pagefrom = url.substring(url.indexOf(context)+context.length(),url.length());
			request.setAttribute("status", 1);
			if (request.getSession().getAttribute("pagefrom")!=null){
				System.out.println(request.getSession().getAttribute("pagefrom"));
				request.setAttribute("pagefrom", request.getSession().getAttribute("pagefrom"));
			}
//			request.setAttribute("pagefrom", pagefrom);
			request.getSession().setAttribute("loged", 1);
			request.getSession().setAttribute("userId", Integer.parseInt(userId));
			request.getSession().setAttribute("name", loginVO.getName());
//			return "home";
		} else {
			request.getSession().setAttribute("loged", 0);
			request.setAttribute("status", 0);
			request.setAttribute("message", loginVO.getMessage());
		}
		return "login";
	}
	
	/*
	 * 准备支付
	 */
	public String recharging(){
		HttpServletRequest request = ServletActionContext.getRequest();    //获取request
		Integer userid;
		if ((userid=isLogined(request))==null){		//未登录
			return "notLogined";
		}
		RechargingVO rechargingVO=userService.getBankInfo(userid);
		request.setAttribute("rechargingVO", rechargingVO);
		return "recharging";
	}
	
	/*
	 * 处理支付
	 */
	public String rechargeRecord(){
		HttpServletRequest request = ServletActionContext.getRequest();    //获取request
		Integer userid;
		if ((userid=isLogined(request))==null){		//未登录
			return "notLogined";
		}
		ArrayList<Recharge> recharges=userService.fetchRechargeRecord(userid);
		request.setAttribute("records", recharges);
		return "rechargeRecord";
	}
	
	/*
	 * 处理电影支付
	 */
	public String payFilm(){
		HttpServletRequest request = ServletActionContext.getRequest();    //获取request
		Integer userid;
		if ((userid=isLogined(request))==null){		//未登录
			return "notLogined";
		}
		String bookId=request.getParameter("bookId");
		Book book=userService.getBookById(bookId);
		User user=userService.getUserById(userid);
		request.setAttribute("book", book);
		request.setAttribute("user", user);
		return "payFilm";
	}
	
	public String consumeRecord(){
		HttpServletRequest request = ServletActionContext.getRequest();    //获取request
		Integer userid;
		if ((userid=isLogined(request))==null){		//未登录
			return "notLogined";
		}
		ArrayList<ConsumeRecordVO> consumeRecordVOs=userService.fetchConsumeRecord(userid);
		request.setAttribute("records", consumeRecordVOs);
		return "consumeRecord";
	}
	
	public String myAccount(){
		HttpServletRequest request = ServletActionContext.getRequest();    //获取request
		Integer userid;
		System.out.println("myAccount()");
		if ((userid=isLogined(request))==null){		//未登录
			return "notLogined";
		}
		User user=userService.getUserById(userid);
		request.setAttribute("user", user);
		return "myAccount";
	}
	
	public String joinActivity(){
		HttpServletRequest request = ServletActionContext.getRequest();    //获取request
		Integer userid;
		System.out.println("joinActivity()");
		if ((userid=isLogined(request))==null){		//未登录
			return "notLogined";
		}
		ActivityVO vo=userService.fetchActivityByUserId(userid);
		request.setAttribute("vo", vo);
		return "joinActivity";
	}
	
	private Integer isLogined(HttpServletRequest request){
		HttpSession session = request.getSession();
		 Object sessionRes=session.getAttribute("userId");
		 if (sessionRes==null){
			 return null;
		 }
		 
		 return (Integer)sessionRes;
	}
	
	private boolean isInt(String str){
	    if(str.matches("[1-9]\\d*"))
	        return true;
	    return false;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	
	
}
