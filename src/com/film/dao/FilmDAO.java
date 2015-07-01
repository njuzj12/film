package com.film.dao;

import java.util.ArrayList;
import java.util.List;

import com.film.model.Film;
import com.film.model.Room;

public class FilmDAO extends BaseDAO {
	
	/*
     *根据id获取电影
     */
	public Film getById(String id){
		List<Film> result=getHibernateTemplate().find("select g from com.film.model.Film g where g.filmId = '" + id + "'");
		if ((result!=null) && (result.size())>0){
			return result.get(0);
		}
		return null;
	}
	
	/*
	 * 根据类别获取电影,state为1,类别为..
	 */
	public ArrayList<Film> getByMultiCondi(String type){
		String hqlString="select g from com.film.model.Film g where g.type = '" + type + "' and g.state='1'";
		ArrayList<Film> result=(ArrayList<Film>)getHibernateTemplate().find(hqlString);
		return result;
	}

	/*
	 * 获取所有厅
	 */
	public ArrayList<Film> getAll(){
		String hqlString="select g from com.film.model.Film g";
		ArrayList<Film> result=(ArrayList<Film>)getHibernateTemplate().find(hqlString);
		return result;
	}
}
