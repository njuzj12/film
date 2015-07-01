package com.film.service;

import java.util.ArrayList;

import com.film.dao.UserDAO;
import com.film.model.User;

public class ManageService {
	private UserDAO userDAO;
	private int[] ageTable=new int[]{20,30,40,50,60,70,1000};
	private String[] cardStatusTable=new String[]{"未激活","已激活","暂停","停止"};
	
	public int[] getUserAge(){
		int[] userAge=new int[7];
		for (int i=0;i<7;i++){
			userAge[i]=0;
		}
		ArrayList<User> users=userDAO.getAll();
		for (User user:users){
			for (int i=0;i<7;i++){
				if (ageTable[i]>user.getAge()){
					userAge[i]++;
					break;
				}
			}
		}
		return userAge;
	}
	
	public ArrayList<Integer> getCard(){
		ArrayList<Integer> cardStatus=new ArrayList<Integer>();
		for (int i=0;i<4;i++){
			cardStatus.add(new Integer(0));
		}
		ArrayList<User> users=userDAO.getAll();
		for (User user:users){
			for (int i=0;i<4;i++){
				if (user.getStatus().equals(cardStatusTable[i])){
					int count=cardStatus.get(i);
					count++;
					cardStatus.set(i, count);
					break;
				}
			}
		}
		return cardStatus;
	}

	public void setUserDAO(UserDAO userDAO) {
		this.userDAO = userDAO;
	}
	
}
