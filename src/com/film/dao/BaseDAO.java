
package com.film.dao;

import java.io.Serializable;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.film.model.BaseBean;

public class BaseDAO extends HibernateDaoSupport{
	//保存记录
    public Serializable save(BaseBean obj){
    	System.out.println("abc");
    	try {
    		Serializable result=getHibernateTemplate().save(obj);
    		return result;
		} catch (Exception e) {
			return -1;
		}
    	
    }
    
    //删除记录
    public void delete(BaseBean obj){
    	getHibernateTemplate().delete(obj);
    }
}
