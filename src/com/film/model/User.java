package com.film.model;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name = "tb_user")
public class User extends BaseBean{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer userId;
	
	@Column(name = "name")
	private String name;
	
	@Column(name = "password")
	private String password;
	
	@Column(name = "sex")
	private String sex;
	
	@Column(name = "status")
	private String status;
	
	@Column(name = "timeCount")
	private String timeCount;
	
	@Column(name = "score")
	private int score;
	
	@Column(name = "level")
	private String level;
	
	@Column(name = "place")
	private String place;
	
	@Column(name = "age")
	private int age;
	
	@Column(name = "money")
	private int money;
	
	@Column(name = "discount")
	private int discount;
	
	@Column(name = "sumPay")
	private int sumPay;
	
	@Column(name = "createTime")
    @Temporal(TemporalType.TIMESTAMP)
    private Date createTime;

	public User(String name,String password){
		this.name=name;
		this.password=password;
		sex="未选择";
		status="未激活";
		score=0;
		level="白银";
		place="";
		age=0;
		money=0;
		discount=10;
		sumPay=0;
		SimpleDateFormat format = new SimpleDateFormat("MM-dd");
		Date date=new Date();
		timeCount=format.format(date);
		SimpleDateFormat format2 = new SimpleDateFormat("yyyy");
		String m=Integer.toString(Integer.parseInt(format2.format(date))+1);
		timeCount=m+'-'+timeCount;
		
		createTime=date;
	}
	
	public User() {
		super();
	}


	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	

	public String getTimeCount() {
		return timeCount;
	}

	public void setTimeCount(String timeCount) {
		this.timeCount = timeCount;
	}

	public int getScore() {
		return score;
	}

	public void setScore(int score) {
		this.score = score;
	}

	public String getLevel() {
		return level;
	}

	public void setLevel(String level) {
		this.level = level;
	}

	public int getMoney() {
		return money;
	}

	public void setMoney(int money) {
		this.money = money;
	}

	

	public int getDiscount() {
		return discount;
	}

	public void setDiscount(int discount) {
		this.discount = discount;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPlace() {
		return place;
	}

	public void setPlace(String place) {
		this.place = place;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public int getSumPay() {
		return sumPay;
	}

	public void setSumPay(int sumPay) {
		this.sumPay = sumPay;
	}
	
	
}
