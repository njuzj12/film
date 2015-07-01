package com.film.dao;

import java.util.List;

import com.film.model.Book;
import com.film.model.Film;

public class BookDAO extends BaseDAO {

	public Book getById(String bookId) {
		List<Book> result=getHibernateTemplate().find("select g from com.film.model.Book g where g.bookId = '" + bookId + "'");
		if ((result!=null) && (result.size())>0){
			return result.get(0);
		}
		return null;
	}

}
