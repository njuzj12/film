package com.film.vo.waiter;

import java.util.ArrayList;

import com.film.model.Plan;
import com.film.model.Room;
import com.film.model.Timequantum;

public class MakePlanVO {
	ArrayList<Room> rooms;
	ArrayList<Timequantum> timequantums;
	ArrayList<Plan> plans;
	String dateString;
	public ArrayList<Room> getRooms() {
		return rooms;
	}
	public void setRooms(ArrayList<Room> rooms) {
		this.rooms = rooms;
	}
	public ArrayList<Timequantum> getTimequantums() {
		return timequantums;
	}
	public void setTimequantums(ArrayList<Timequantum> timequantums) {
		this.timequantums = timequantums;
	}
	public ArrayList<Plan> getPlans() {
		return plans;
	}
	public void setPlans(ArrayList<Plan> plans) {
		this.plans = plans;
	}
	public String getDateString() {
		return dateString;
	}
	public void setDateString(String dateString) {
		this.dateString = dateString;
	}
	
	
}
