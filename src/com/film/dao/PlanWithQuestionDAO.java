package com.film.dao;

import java.util.ArrayList;

import com.film.model.PlanWithQuestion;

public class PlanWithQuestionDAO extends BaseDAO {

	public ArrayList<PlanWithQuestion> getByFilmId(int filmId) {
		ArrayList<PlanWithQuestion> result=(ArrayList<PlanWithQuestion>)getHibernateTemplate().find("select g from com.film.model.PlanWithQuestion g where g.filmId = '" + filmId + "'");
		
		return result;
	}

}
