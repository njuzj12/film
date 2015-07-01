package com.film.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import com.film.model.Bankaccountinfo;
import com.film.model.Plan;

public class BankaccountinfoDAO extends BaseDAO {

	public Bankaccountinfo getById(String bankId) {
		String query="select g from com.film.model.Bankaccountinfo g where g.bankAccountId = '" + bankId + "'";
		System.out.println(query);
		List<Bankaccountinfo> result=getHibernateTemplate().find(query);
		if ((result!=null) && (result.size())>0){
			return result.get(0);
		}
		return null;
	}

	public int updateMoney(int balance, Integer bankAccountId) {
		System.out.println("updateMoney="+balance);
		String query="update com.film.model.Bankaccountinfo a set a.money="+balance+ " where a.bankAccountId='"+bankAccountId+"'";
		System.out.println("query="+query);
		Session session=getSession();
		
		Query q=session.createQuery(query);

		int result=q.executeUpdate();
		session.close();
		return result;
	}

}
