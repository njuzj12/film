package com.film.dao;

import java.util.List;

import com.film.model.Film;
import com.film.model.Plan;
import com.film.model.Question;

public class QuestionDAO extends BaseDAO {

	/*
	 * 获得最新的一个问题
	 */
	
	public Question getLatestQuestion(){
		List<Question> result=getHibernateTemplate().find("select g from com.film.model.Question g order by g.createTime desc");
		if ((result!=null) && (result.size())>0){
			return result.get(0);
		}
		return null;
	}

	public Question getById(int qid) {
		List<Question> result=getHibernateTemplate().find("select g from com.film.model.Question g where g.qId = '" + qid + "'");
		if ((result!=null) && (result.size())>0){
			return result.get(0);
		}
		return null;
	}
}
