package com.film.vo.film;

import java.util.Date;

import com.film.model.Film;
import com.film.model.Plan;
import com.film.model.Room;
import com.film.model.Timequantum;

public class PlanVO implements Comparable<PlanVO>{
	private int planId;
	private int filmId;
	private String filmName;
	private int price;
	private int timeId;
	private int start;
	private int end;
	private int state;
    private String playTime;
	private int roomId;
	private int row;
	private int column;
	private String sold;
	private boolean[][] seat;
    private Date createTime;
    private int remainTicket;
    private int discount;
    
    
    public PlanVO(Film film,Plan plan,Room room,Timequantum time,int discount){
    	this.discount=discount;
    	sold=plan.getSold();
    	planId=plan.getPlanId();
    	filmName=film.getName();
    	price=film.getPrice();
    	filmId=plan.getFilmId();
    	timeId=plan.getTimeId();
    	start=time.getBegin();
    	end=time.getEnd();
    	state=plan.getState();
    	playTime=plan.getPlayTime();
    	roomId=plan.getRoomId();
    	row=room.getRow();
    	column=room.getColumn();
    	seat=new boolean[row][column];
    	remainTicket=row*column;
    	if (sold==null){
    		for (int i=0;i<row;i++){
    			for (int j=0;j<column;j++){
    				seat[i][j]=false;
    			}
    		}
    	} else {
    		String[] splitString=sold.split(",");
    		for (int i=0;i<row;i++){
    			for (int j=0;j<column;j++){
    				if (splitString[i].charAt(j)=='0'){
    					seat[i][j]=false;
    				} else {
    					seat[i][j]=true;
    					remainTicket--;
    				}
    			}
    		}
    	}
    	createTime=plan.getCreateTime();
    }
	public int getPlanId() {
		return planId;
	}
	public void setPlanId(int planId) {
		this.planId = planId;
	}
	public int getFilmId() {
		return filmId;
	}
	public void setFilmId(int filmId) {
		this.filmId = filmId;
	}
	public int getTimeId() {
		return timeId;
	}
	public void setTimeId(int timeId) {
		this.timeId = timeId;
	}
	public int getStart() {
		return start;
	}
	public void setStart(int start) {
		this.start = start;
	}
	public int getEnd() {
		return end;
	}
	public void setEnd(int end) {
		this.end = end;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public String getPlayTime() {
		return playTime;
	}
	public void setPlayTime(String playTime) {
		this.playTime = playTime;
	}
	public int getRoomId() {
		return roomId;
	}
	public void setRoomId(int roomId) {
		this.roomId = roomId;
	}
	public int getRow() {
		return row;
	}
	public void setRow(int row) {
		this.row = row;
	}
	public int getColumn() {
		return column;
	}
	public void setColumn(int column) {
		this.column = column;
	}
	public String getSold() {
		return sold;
	}
	public void setSold(String sold) {
		this.sold = sold;
	}
	public boolean[][] getSeat() {
		return seat;
	}
	public void setSeat(boolean[][] seat) {
		this.seat = seat;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public PlanVO() {
		super();
	}
	public int getRemainTicket() {
		return remainTicket;
	}
	public void setRemainTicket(int remainTicket) {
		this.remainTicket = remainTicket;
	}
	@Override
	public int compareTo(PlanVO o) {
		if (start<o.start){
			return -1;
		}
		if (start>o.start){
			return 1;
		}
		if (roomId<o.roomId){
			return -1;
		} else {
			return 1;
		}
		
	}
	public String getFilmName() {
		return filmName;
	}
	public void setFilmName(String filmName) {
		this.filmName = filmName;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getDiscount() {
		return discount;
	}
	public void setDiscount(int discount) {
		this.discount = discount;
	}
    
    
}
