package com.film.dao;

import java.util.ArrayList;
import java.util.List;

import com.film.model.Room;
import com.film.model.Timequantum;

public class TimequantumDAO extends BaseDAO {
	/*
	 * 获取所有时间间隔
	 */
	public ArrayList<Timequantum> getAll(){
		String hqlString="select g from com.film.model.Timequantum g";
		ArrayList<Timequantum> result=(ArrayList<Timequantum>)getHibernateTemplate().find(hqlString);
		return result;
	}

	public Timequantum getById(int timeId) {
		List<Timequantum> result=getHibernateTemplate().find("select g from com.film.model.Timequantum g where g.id = '" + timeId + "'");
		if ((result!=null) && (result.size())>0){
			return result.get(0);
		}
		return null;
	}
}
