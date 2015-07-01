package com.film.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import com.film.model.Film;
import com.film.model.Plan;
import com.film.model.Question;
import com.mysql.fabric.xmlrpc.base.Array;

public class PlanDAO extends BaseDAO {

	public boolean remove(int roomId, int timeId,String playTime){
		String query="delete from com.film.model.Plan g where g.roomId = '" + roomId + "' and g.timeId= '" + timeId+"' and g.playTime='"+playTime+"'";
		System.out.println(query);
		
		Session session=getSession();
		System.out.println("removePlan()");
		Query q=session.createQuery(query);
		System.out.println("removePlan()");
		int result=q.executeUpdate();
		session.close();
		if(result==0){
			return false;
		}else{
			return true;
		}
	}
	
	/*
	 * 获得某一天的所有计划
	 */
	
	public ArrayList<Plan> getSomedayPlan(String playTime){
		ArrayList<Plan> result=(ArrayList<Plan>)getHibernateTemplate().find("select g from com.film.model.Plan g where g.playTime = '" + playTime + "'");
		return result;
	}
	
	/*
	 * 审批通过放映计划
	 */

	public int updateState(int roomId, int timeId, String playTime) {
		System.out.println("updateState");
		String query="update com.film.model.Plan g set g.state=1 where g.roomId='"+roomId+ "' and g.timeId='" + timeId+ "' and g.playTime='"+playTime+"'";
		System.out.println("query="+query);
		Session session=getSession();
		Query q=session.createQuery(query);
		int result=q.executeUpdate();
		session.close();
		return result;
	}

	public Plan getByCondi(int roomId, int timeId, String playTime) {
		ArrayList<Plan> result=(ArrayList<Plan>)getHibernateTemplate().find("select g from com.film.model.Plan g where g.roomId='"+roomId+ "' and g.timeId='" + timeId+ "' and g.playTime = '" + playTime + "'");
		if ((result!=null) && (result.size()>0)){
			return result.get(0);
		}else {
			return null;
		}
		
	}

	public ArrayList<Plan> getSomedayAccessPlan(String filmId,String dateString) {
		ArrayList<Plan> result=(ArrayList<Plan>)getHibernateTemplate().find("select g from com.film.model.Plan g where g.playTime = '" + dateString + "' and filmId='"+filmId+"' and state='1'");
		return result;
	}

	public Plan getById(String planId) {
		List<Plan> result=getHibernateTemplate().find("select g from com.film.model.Plan g where g.planId = '" + planId + "'");
		if ((result!=null) && (result.size())>0){
			return result.get(0);
		}
		return null;
	}

	public int updateSeat(String seatString,int planId) {
		System.out.println("updateSeat");
		String query="update com.film.model.Plan g set g.sold='"+seatString+"' where g.planId='"+planId+ "'";
		System.out.println("query="+query);
		Session session=getSession();
		Query q=session.createQuery(query);
		int result=q.executeUpdate();
		session.close();
		return result;
	}

}
