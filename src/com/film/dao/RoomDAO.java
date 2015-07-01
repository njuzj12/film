package com.film.dao;

import java.util.ArrayList;
import java.util.List;


import com.film.model.Film;
import com.film.model.Room;

public class RoomDAO extends BaseDAO {
	/*
	 * 获取所有厅
	 */
	public ArrayList<Room> getAll(){
		String hqlString="select g from com.film.model.Room g";
		ArrayList<Room> result=(ArrayList<Room>)getHibernateTemplate().find(hqlString);
		return result;
	}

	public Room getById(int roomId) {
		List<Room> result=getHibernateTemplate().find("select g from com.film.model.Room g where g.roomId = '" + roomId + "'");
		if ((result!=null) && (result.size())>0){
			return result.get(0);
		}
		return null;
	}
}
