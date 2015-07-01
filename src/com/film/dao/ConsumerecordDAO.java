package com.film.dao;

import java.util.ArrayList;
import java.util.List;

import com.film.model.Consumerecord;
import com.film.model.User;

public class ConsumerecordDAO extends BaseDAO {

	public ArrayList<Consumerecord> getByUserId(Integer userid) {
		ArrayList<Consumerecord> users=(ArrayList<Consumerecord>)getHibernateTemplate().find("select g from com.film.model.Consumerecord g where g.userId = '" + userid + "'");
	
		return users;
	}

}
