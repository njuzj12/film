package com.film.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import com.film.dao.FilmDAO;
import com.film.dao.PlanDAO;
import com.film.dao.PlanWithQuestionDAO;
import com.film.dao.QuestionDAO;
import com.film.dao.RoomDAO;
import com.film.dao.TimequantumDAO;
import com.film.dao.UserDAO;
import com.film.model.Film;
import com.film.model.Plan;
import com.film.model.PlanWithQuestion;
import com.film.model.Question;
import com.film.model.Room;
import com.film.model.Timequantum;
import com.film.model.User;
import com.film.vo.film.PlanVO;
import com.film.vo.user.HomeVO;
import com.film.vo.waiter.AjaxAddPlanVO;
import com.film.vo.waiter.MakePlanVO;

import edu.emory.mathcs.backport.java.util.Collections;

public class FilmService {
	FilmDAO filmDAO;
	RoomDAO roomDAO;
	PlanDAO planDAO;
	UserDAO userDAO;
	TimequantumDAO timequantumDAO;
	QuestionDAO questionDAO;
	PlanWithQuestionDAO planWithQuestionDAO;
	
	public HomeVO fetchInfoFromHome(){
		HomeVO homeVO=new HomeVO();
		homeVO.setXiju(filmDAO.getByMultiCondi("喜剧"));
		homeVO.setMaoxian(filmDAO.getByMultiCondi("冒险"));
		homeVO.setDongzuo(filmDAO.getByMultiCondi("动作"));
		homeVO.setKongbu(filmDAO.getByMultiCondi("恐怖"));
		homeVO.setAiqing(filmDAO.getByMultiCondi("爱情"));
		homeVO.setJiating(filmDAO.getByMultiCondi("家庭"));
		homeVO.setLunli(filmDAO.getByMultiCondi("伦理"));
		homeVO.setFilms(filmDAO.getAll());
		return homeVO;
	}
	
	public Film fetchInfoFromfilmInfo(String filmId) {
		Film film=filmDAO.getById(filmId);
		return film;
	}
	
	public MakePlanVO fetchInfoFromMakePlan(){
		MakePlanVO makePlanVO=new MakePlanVO();
		makePlanVO.setRooms(roomDAO.getAll());
		makePlanVO.setTimequantums(timequantumDAO.getAll());
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		Date date=new Date();
		String dateString=format.format(date);
		makePlanVO.setDateString(dateString);
		makePlanVO.setPlans(planDAO.getSomedayPlan(dateString));
		return makePlanVO;
	}
	
	public AjaxAddPlanVO addPlan(int roomId, int timeId, int filmId,
			String playTime) {
		
		Plan plan=new Plan();
		plan.setRoomId(roomId);
		plan.setTimeId(timeId);
		plan.setFilmId(filmId);
		plan.setPlayTime(playTime);
		plan.setState(0);
		plan.setCreateTime(new Date());
		planDAO.save(plan);
		Film film=filmDAO.getById(Integer.toString(filmId));
		AjaxAddPlanVO ajaxAddPlanVO=new AjaxAddPlanVO();
		ajaxAddPlanVO.setFilmName(film.getName());
		ajaxAddPlanVO.setRoomId(roomId);
		ajaxAddPlanVO.setTimeId(timeId);
		return ajaxAddPlanVO;
	}
	
	public AjaxAddPlanVO accessPlan(int roomId, int timeId, String playTime) {
		
		planDAO.updateState(roomId,timeId,playTime);
		Plan plan=planDAO.getByCondi(roomId,timeId,playTime);
		Film film=filmDAO.getById(Integer.toString(plan.getFilmId()));
		AjaxAddPlanVO ajaxAddPlanVO=new AjaxAddPlanVO();
		ajaxAddPlanVO.setFilmName(film.getName());
		ajaxAddPlanVO.setRoomId(roomId);
		ajaxAddPlanVO.setTimeId(timeId);
		return ajaxAddPlanVO;
	}
	
	public AjaxAddPlanVO removePlan(int roomId, int timeId,String playTime) {
		
		planDAO.remove(roomId,timeId,playTime);
		AjaxAddPlanVO ajaxAddPlanVO=new AjaxAddPlanVO();
		ajaxAddPlanVO.setRoomId(roomId);
		ajaxAddPlanVO.setTimeId(timeId);
		return ajaxAddPlanVO;
	}
	
	public String addQuestion(int filmId, String title, String a,
			String b, String c) {
		Question question=new Question();
		question.setTitle(title);
		question.setA(a);
		question.setB(b);
		question.setC(c);
		question.setCreateTime(new Date());
		questionDAO.save(question);
		
		PlanWithQuestion planWithQuestion=new PlanWithQuestion();
		planWithQuestion.setaNum(0);
		planWithQuestion.setbNum(0);
		planWithQuestion.setcNum(0);
		planWithQuestion.setCreateTime(new Date());
		Question latestQ=questionDAO.getLatestQuestion();
//		System.out.println("qid="+latestQ.getqId());
		planWithQuestion.setqId(latestQ.getqId());
		planWithQuestion.setFilmId(filmId);
		planWithQuestionDAO.save(planWithQuestion);
		return "添加活动成功";
	}
	
	public ArrayList<Plan> getTodayFilms(String playTime) {
		return planDAO.getSomedayPlan(playTime);
	}
	
	public ArrayList<PlanVO> fetchPlanInfoByTime(String filmId,String dateString) {
		ArrayList<Plan> plans=planDAO.getSomedayAccessPlan(filmId,dateString);
		ArrayList<PlanVO> planVOs=new ArrayList<PlanVO>();
		for (Plan plan:plans){
			Room room=roomDAO.getById(plan.getRoomId());
			Timequantum timequantum=timequantumDAO.getById(plan.getTimeId());
			Film film=filmDAO.getById(Integer.toString(plan.getFilmId()));
			PlanVO planVO=new PlanVO(film,plan,room,timequantum,10);
			planVOs.add(planVO);
		}
		Collections.sort(planVOs);
		return planVOs;
	}
	
	public PlanVO getPlanById(int userid,String planId) {
		User user=userDAO.getUserByUserId(userid);
		
		if (user.getStatus().equals("停止") || user.getStatus().equals("未激活") || user.getStatus().equals("暂停")){
			return null;
		}
		Plan plan=planDAO.getById(planId);
		Room room=roomDAO.getById(plan.getRoomId());
		Timequantum timequantum=timequantumDAO.getById(plan.getTimeId());
		Film film=filmDAO.getById(Integer.toString(plan.getFilmId()));
		PlanVO planVO=new PlanVO(film,plan,room,timequantum,user.getDiscount());
		return planVO;
	}
	
	public PlanVO getPlanByWaiter(int waiterId,String planId) {
		
		Plan plan=planDAO.getById(planId);
		Room room=roomDAO.getById(plan.getRoomId());
		Timequantum timequantum=timequantumDAO.getById(plan.getTimeId());
		Film film=filmDAO.getById(Integer.toString(plan.getFilmId()));
		PlanVO planVO=new PlanVO(film,plan,room,timequantum,9);
		return planVO;
	}
	
	public Film getFilmById(int id){
		return filmDAO.getById(Integer.toString(id));
	}
	
	public ArrayList<Film> getAllFilms() {
		return filmDAO.getAll();
	}

	public void setFilmDAO(FilmDAO filmDAO) {
		this.filmDAO = filmDAO;
	}

	public void setRoomDAO(RoomDAO roomDAO) {
		this.roomDAO = roomDAO;
	}

	public void setTimequantumDAO(TimequantumDAO timequantumDAO) {
		this.timequantumDAO = timequantumDAO;
	}

	

	public void setPlanDAO(PlanDAO planDAO) {
		this.planDAO = planDAO;
	}

	public void setQuestionDAO(QuestionDAO questionDAO) {
		this.questionDAO = questionDAO;
	}

	public void setPlanWithQuestionDAO(PlanWithQuestionDAO planWithQuestionDAO) {
		this.planWithQuestionDAO = planWithQuestionDAO;
	}

	public void setUserDAO(UserDAO userDAO) {
		this.userDAO = userDAO;
	}

	

	

	

	

	

}
