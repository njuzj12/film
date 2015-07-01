package com.film.action;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.film.model.User;
import com.film.service.UserService;
import com.google.common.base.Function;
import com.opensymphony.xwork2.ActionSupport;

public class AjaxUserAction extends ActionSupport {
		/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
		private UserService userService;
		private String message;
		private int score;
		private int money;

		public String logout(){
			HttpServletRequest request = ServletActionContext.getRequest();    //获取request
			request.getSession().invalidate();
			request.getSession(true);
			System.out.println("已清空session");
			return "logout";
		}
		
		public String pay(){
			HttpServletRequest request = ServletActionContext.getRequest();    //获取request
			System.out.println("pay()");
			Integer userid;
			if ((userid=isLogined(request))==null){		//未登录
				message="failure";
				return "pay";
			}
			
			String choose=request.getParameter("choose");
			String bookId=request.getParameter("bookId");
			
			if (choose.equals("1")){
				//现金支付
				message=userService.payByMoney(userid,bookId);
			} else if (choose.equals("2")){
				//银行卡支付
				String bankId=request.getParameter("bankId");
				String password=request.getParameter("password");
				message=userService.payByBank(bankId,password,userid,bookId);
			}
			return "pay";
		}
		
		public String recharge(){
			HttpServletRequest request = ServletActionContext.getRequest();    //获取request
			System.out.println("recharge()");
			Integer userid;
			if ((userid=isLogined(request))==null){		//未登录
				message="failure";
				return "recharge";
			}
			String recharge=request.getParameter("recharge");
			String bankId=request.getParameter("bankId");
			String password=request.getParameter("password");
			message=userService.recharge(bankId,password,userid,recharge);

			return "recharge";
		}
		
		public String modifyInfo(){
			System.out.println("modifyInfo()");
			HttpServletRequest request = ServletActionContext.getRequest();    //获取request
			Integer userid;
			if ((userid=isLogined(request))==null){		//未登录
				message="failure";
				return "modifyInfo";
			}
			String name=request.getParameter("name");
			String sex=request.getParameter("sex");
			String place=request.getParameter("place");
			String age=request.getParameter("age");
			message=userService.modifyInfo(userid,name,sex,place,age);
			return "modifyInfo";
		}
		
		public String cancelUser(){
			System.out.println("cancelUser()");
			HttpServletRequest request = ServletActionContext.getRequest();    //获取request
			Integer userid;
			if ((userid=isLogined(request))==null){		//未登录
				message="failure";
				return "cancelUser";
			}
			message=userService.cancelUser(userid);
			request.getSession().invalidate();
			request.getSession(true);
			System.out.println("已清空session");
			return "cancelUser";
		}
		
		public String changeToMoney(){
			System.out.println("changeToMoney()");
			HttpServletRequest request = ServletActionContext.getRequest();    //获取request
			Integer userid;
			if ((userid=isLogined(request))==null){		//未登录
				message="failure";
				return "changeToMoney";
			}
			User user=userService.changeToMoney(userid);
			if (user==null){
				message="failure";
			} else {
				money=user.getMoney();
				score=user.getScore();
				message="success";
				
			}
			return "changeToMoney";
		}
		
		public String waiterLogin(){
			HttpServletRequest request = ServletActionContext.getRequest();    //获取request
			System.out.println("waiterLogin()");
			request.getSession().setAttribute("waiterId", 12345);
			return "waiterLogin";
		}
		
		public String manageLogin(){
			HttpServletRequest request = ServletActionContext.getRequest();    //获取request
			System.out.println("manageLogin()");
			request.getSession().setAttribute("manageId", 12345);
			return "manageLogin";
		}
		
		public void setUserService(UserService userService) {
			this.userService = userService;
		}
		
		private Integer isLogined(HttpServletRequest request){
			HttpSession session = request.getSession();
			 Object sessionRes=session.getAttribute("userId");
			 if (sessionRes==null){
				 return null;
			 }
			 return (Integer)sessionRes;
		}

		public String getMessage() {
			return message;
		}

		public void setMessage(String message) {
			this.message = message;
		}

		public int getScore() {
			return score;
		}

		public void setScore(int score) {
			this.score = score;
		}

		public int getMoney() {
			return money;
		}

		public void setMoney(int money) {
			this.money = money;
		}
		
		
}
