package com.film.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import com.film.model.User;


public class UserDAO extends BaseDAO{
    /*
     *根据userId获取用户
     */
	public User getUserByUserId(int userId){
		List<User> users=getHibernateTemplate().find("select g from com.film.model.User g where g.userId = '" + userId + "'");
		if ((users!=null) && (users.size())>0){
			return users.get(0);
		}
		return null;
	}
//	
//	/*
//	 * 根据host和guest可以唯一得到一个Guest对象
//	 */
//	public Guest getGuestByHostAndGuest(int host, int guest){
//		List<Guest> list = getHibernateTemplate().find("select g from com.aiulove.bean.Guest g where g.host = '" + host + "' and g.guest = '" + guest + "'");
//		if(list.size() == 0){
//			return null;
//		}
//		else{
//			return list.get(0);
//		}
//	}

	public User getByIdAndPass(String userId, String password) {
		List<User> users=getHibernateTemplate().find("select g from com.film.model.User g where g.userId = '" + userId + "' and password='"+password+"'");
		if ((users!=null) && (users.size())>0){
			return users.get(0);
		}
		return null;
	}

	public int updateMoney(int balance,int userId) {
		System.out.println("updateMoney="+balance);
		String query="update com.film.model.User a set a.money="+balance+ " where a.userId='"+userId+"'";
		System.out.println("query="+query);
		Session session=getSession();
		
		Query q=session.createQuery(query);

		int result=q.executeUpdate();
		session.close();
		return result;
	}

	public int modifyInfo(Integer userid, String name, String sex,
			String place, String age) {
		System.out.println("modifyInfo");
		String query="update com.film.model.User g set g.name='"+name+"',g.sex='"+sex+"',g.place='"+place+"',g.age='"+age+"' where g.userId='"+userid+ "'";
		System.out.println("query="+query);
		Session session=getSession();
		Query q=session.createQuery(query);
		int result=q.executeUpdate();
		session.close();
		return result;
	}

	public int updateStage(User user) {
		System.out.println("updateStage");
		String query="update com.film.model.User g set g.status='"+user.getStatus()+"',g.timeCount='"+user.getTimeCount()+"',g.sumPay='"+user.getSumPay()+"',g.level='"+user.getLevel()+"',g.score='"+user.getScore()+"',g.discount='"+user.getDiscount()+"' where g.userId='"+user.getUserId()+ "'";
		System.out.println("query="+query);
		Session session=getSession();
		Query q=session.createQuery(query);
		int result=q.executeUpdate();
		session.close();
		return result;
	}

	public int updateStatus(Integer userid) {
		System.out.println("updateStatus");
		String query="update com.film.model.User g set g.status='停止' where g.userId='"+userid+ "'";
		System.out.println("query="+query);
		Session session=getSession();
		Query q=session.createQuery(query);
		int result=q.executeUpdate();
		session.close();
		return result;
	}

	public ArrayList<User> getAll() {
		String query="select g from com.film.model.User g";
//		System.out.println(query);
		ArrayList<User> users=(ArrayList<User>)getHibernateTemplate().find(query);
		return users;
	}
}
