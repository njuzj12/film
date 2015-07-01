package com.film.dao;

import java.util.ArrayList;

import com.film.model.Recharge;

public class RechargeDAO extends BaseDAO {

	public ArrayList<Recharge> getById(Integer userid) {
		ArrayList<Recharge> users=(ArrayList<Recharge>)getHibernateTemplate().find("select g from com.film.model.Recharge g where g.userId = '" + userid + "'");
		
		return users;
	}

}
