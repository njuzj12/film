
package com.film.service;

import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import com.film.dao.BankaccountinfoDAO;
import com.film.dao.BookDAO;
import com.film.dao.ConsumerecordDAO;
import com.film.dao.FilmDAO;
import com.film.dao.PlanDAO;
import com.film.dao.PlanWithQuestionDAO;
import com.film.dao.QuestionDAO;
import com.film.dao.RechargeDAO;
import com.film.dao.RoomDAO;
import com.film.dao.UserDAO;
import com.film.model.Bankaccountinfo;
import com.film.model.Book;
import com.film.model.Consumerecord;
import com.film.model.Film;
import com.film.model.Plan;
import com.film.model.PlanWithQuestion;
import com.film.model.Question;
import com.film.model.Recharge;
import com.film.model.Room;
import com.film.model.User;
import com.film.vo.user.ActivityVO;
import com.film.vo.user.ConsumeRecordVO;
import com.film.vo.user.LoginVO;
import com.film.vo.user.RechargingVO;




public class UserService {
	private UserDAO userDAO;
	private FilmDAO filmDAO;
	private BookDAO bookDAO;
	private PlanDAO planDAO;
	private RoomDAO roomDAO;
	private RechargeDAO rechargeDAO;
	private ConsumerecordDAO consumerecordDAO;
	private BankaccountinfoDAO bankaccountinfoDAO;
	private PlanWithQuestionDAO planWithQuestionDAO;
	private QuestionDAO questionDAO;
	
	public int register(String name,String password){
		User user=new User(name,password);
		Serializable result=userDAO.save(user);
		return (Integer) result;	
	}
	
	public LoginVO qualify(String userId,String password){
		User user=userDAO.getByIdAndPass(userId,password);
		LoginVO loginVO=null;
		if (user==null){
			loginVO=new LoginVO(null,"失败",false);
		} else {
			if (user.getStatus().equals("停止")){
				loginVO=new LoginVO(null,"失败",false);
			}else {
				loginVO=new LoginVO(user.getName(),"成功",true);
			}
		}
		return loginVO;
	}
	
	public RechargingVO getBankInfo(int userId){
		User user=userDAO.getUserByUserId(userId);
		if (user!=null){
			RechargingVO rechargingVO=new RechargingVO(user.getMoney(), user.getDiscount());
			return rechargingVO;
		} else {
			return null;
		}
		
	}
	
	public void setUserDAO(UserDAO userDAO) {
		this.userDAO = userDAO;
	}

	public void setFilmDAO(FilmDAO filmDAO) {
		this.filmDAO = filmDAO;
	}

	public void setBookDAO(BookDAO bookDAO) {
		this.bookDAO = bookDAO;
	}

	public void setRoomDAO(RoomDAO roomDAO) {
		this.roomDAO = roomDAO;
	}

	public void setConsumerecordDAO(ConsumerecordDAO consumerecordDAO) {
		this.consumerecordDAO = consumerecordDAO;
	}

	public void setPlanDAO(PlanDAO planDAO) {
		this.planDAO = planDAO;
	}
	
	public void setBankaccountinfoDAO(BankaccountinfoDAO bankaccountinfoDAO) {
		this.bankaccountinfoDAO = bankaccountinfoDAO;
	}
	
	

	public void setRechargeDAO(RechargeDAO rechargeDAO) {
		this.rechargeDAO = rechargeDAO;
	}

	public Serializable book(Integer userid, String planId, String seatNum,
			String rowString, String columnString, String price) {
		Book book=new Book();
		book.setUserId(userid);
		book.setPlanId(Integer.parseInt(planId));
		book.setAmount(Integer.parseInt(seatNum));
		book.setCreateTime(new Date());
		book.setPrice(Integer.parseInt(price));
		book.setSoldRow(rowString);
		book.setSoldColumn(columnString);
		book.setState(0);
		return bookDAO.save(book);
	}
	
	public String waiterBuy(String planId, String seatNum, String rowString,
			String columnString, String price) {
		Book book=new Book();
		book.setUserId(12345);
		book.setPlanId(Integer.parseInt(planId));
		book.setAmount(Integer.parseInt(seatNum));
		book.setCreateTime(new Date());
		book.setPrice(Integer.parseInt(price));
		book.setSoldRow(rowString);
		book.setSoldColumn(columnString);
		book.setState(0);
		if (!occupiedSeat(book)){
			//选位失败
			System.out.println("选位失败");
			return "failure";
		}
		
		
		return "success";
	}
	
	

	public void setPlanWithQuestionDAO(PlanWithQuestionDAO planWithQuestionDAO) {
		this.planWithQuestionDAO = planWithQuestionDAO;
	}

	
	
	public void setQuestionDAO(QuestionDAO questionDAO) {
		this.questionDAO = questionDAO;
	}

	public Book getBookById(String bookId) {
		
		return bookDAO.getById(bookId);
	}
	
	public User getUserById(int userId){
		return userDAO.getUserByUserId(userId);
	}

	public String payByMoney(Integer userid, String bookId) {
		
		Book book=bookDAO.getById(bookId);
		if (book.getUserId()!=userid){
			//不是同一个人的订单
			System.out.println("不是同一个人的订单");
			return "failure";
		}
		User user=userDAO.getUserByUserId(userid);
		if (user.getMoney()<book.getPrice()){
			//余额不足
			System.out.println("余额不足");
			return "failure";
		}
		if (!occupiedSeat(book)){
			//选位失败
			System.out.println("选位失败");
			return "failure";
		}
		Consumerecord consumerecord=new Consumerecord();
		int balance=user.getMoney()-book.getPrice();
		
		int result=userDAO.updateMoney(balance,userid);
		if (result==-1){
			//修改金额失败
			System.out.println("修改金额失败");
			return "failure";
		}
		consumerecord.setBalance(balance);
		consumerecord.setConsumeMoney(book.getPrice());
		consumerecord.setCreateTime(new Date());
		consumerecord.setPlanId(book.getPlanId());
		consumerecord.setUserId(userid);
		consumerecord.setPayType("余额支付");
		consumerecordDAO.save(consumerecord);
		
		return "success";
	}

	public String payByBank(String bankId, String password, Integer userid,
			String bookId) {
		
		Book book=bookDAO.getById(bookId);
		if (book.getUserId()!=userid){
			//不是同一个人的订单
			System.out.println("不是同一个人的订单");
			return "failure";
		}
		User user=userDAO.getUserByUserId(userid);
		Bankaccountinfo bankaccountinfo=bankaccountinfoDAO.getById(bankId);
		if (bankaccountinfo==null){
			//银行卡号不存在
			System.out.println("银行卡号不存在");
			return "failure";
		} 
		if (!password.equals(Integer.toString(bankaccountinfo.getPassword()))){
			//密码错误
			System.out.println("密码错误");
			return "failure";
		}
		if (bankaccountinfo.getMoney()<book.getPrice()){
			//余额不足
			System.out.println("余额不足");
			return "failure";
		}
		int balance=bankaccountinfo.getMoney()-book.getPrice();
		if (!occupiedSeat(book)){
			//选位失败
			System.out.println("选位失败");
			return "failure";
		}
		
		int result=bankaccountinfoDAO.updateMoney(balance,bankaccountinfo.getBankAccountId());
		if (result==-1){
			//修改金额失败
			System.out.println("修改金额失败");
			return "failure";
		}
		
		Consumerecord consumerecord=new Consumerecord();
		consumerecord.setBalance(user.getMoney());
		consumerecord.setConsumeMoney(book.getPrice());
		consumerecord.setCreateTime(new Date());
		consumerecord.setPlanId(book.getPlanId());
		consumerecord.setUserId(userid);
		consumerecord.setPayType("银行支付");
		consumerecordDAO.save(consumerecord);
		return "success";
	}

	public ArrayList<ConsumeRecordVO> fetchConsumeRecord(Integer userid) {
		ArrayList<Consumerecord> consumerecords=consumerecordDAO.getByUserId(userid);
		ArrayList<ConsumeRecordVO> consumeRecordVOs=new ArrayList<ConsumeRecordVO>();
		for (Consumerecord c:consumerecords){
			Plan plan=planDAO.getById(Integer.toString(c.getPlanId()));
			Film film=filmDAO.getById(Integer.toString(plan.getFilmId()));
			ConsumeRecordVO consumeRecordVO=new ConsumeRecordVO();
			consumeRecordVO.setBalance(c.getBalance());
			consumeRecordVO.setConsumeMoney(c.getConsumeMoney());
			consumeRecordVO.setCreateTime(c.getCreateTime());
			consumeRecordVO.setFilmName(film.getName());
			consumeRecordVO.setPayType(c.getPayType());
			consumeRecordVOs.add(consumeRecordVO);
		}
		return consumeRecordVOs;
	}
	
	private boolean occupiedSeat(Book book){
		Plan plan=planDAO.getById(Integer.toString(book.getPlanId()));
		Room room=roomDAO.getById(plan.getRoomId());
		
		boolean[][] seat=changeFromStringToSeat(plan,room);
//		for (int i=0;i<10;i++){
//			for (int j=0;j<10;j++){
//				System.out.printf("%s",seat[i][j]);
//			}
//			System.out.println();
//		}
		String[] buyRow=book.getSoldRow().split(",");
		
		String[] buyColumn=book.getSoldColumn().split(",");
		
		for (int i=0;i<buyRow.length;i++){
			int row=Integer.parseInt(buyRow[i]);
			int column=Integer.parseInt(buyColumn[i]);
//			System.out.println(row);
//			System.out.println(column);
//			System.out.println(seat[row][column]);
			if (seat[row][column]){
				return false;
			} else {
				seat[row][column]=true;
			}
		}
		String seatString=changeFromSeatToString(seat,room.getRow(),room.getColumn());
//		System.out.println(seatString);
		int result=planDAO.updateSeat(seatString,book.getPlanId());
		if (result==-1){
			return false;
		} else {
			return true;
		}
		
	}
	
	private String changeFromSeatToString(boolean[][] seat,int row,int column) {
		String result="";
		for (int i=0;i<row;i++){
			String rowString;
			if (i==0){ 
				rowString="";
			} else {
				rowString=",";
			}
			for (int j=0;j<column;j++){
				if (seat[i][j]){
					rowString+='1';
				} else {
					rowString+='0';
				}
			}
			result+=rowString;
			
		}
		return result;
	}

	private boolean[][] changeFromStringToSeat(Plan plan,Room room){
		int row=room.getRow();
		int column=room.getColumn();
		boolean[][] result=new boolean[row][column];
		if (plan.getSold()==null){
			for (int i=0;i<row;i++){
				for (int j=0;j<column;j++){
					result[i][j]=false;
				}
			}
		} else {
			String[] seat=plan.getSold().split(",");
			for (int i=0;i<row;i++){
				for (int j=0;j<column;j++){
					if (seat[i].charAt(j)=='0'){
						result[i][j]=false;
					} else {
						result[i][j]=true;
					}
				}
			}
		}
		return result;
	}

	public String modifyInfo(Integer userid, String name, String sex,
			String place, String age) {
		int result=userDAO.modifyInfo(userid,name,sex,place,age);
		if (result==-1){
			return "failure";
		} else {
			return "success";
		}
	}

	public ArrayList<Recharge> fetchRechargeRecord(Integer userid) {
		return rechargeDAO.getById(userid);
	}

	public String recharge(String bankId, String password, Integer userid,
			String recharge) {
		if (!isInt(recharge)){
			System.out.println("输入的金额不是整数");
			return "输入的金额不是整数";
		}
		int rechargeNum=Integer.parseInt(recharge);
		User user=userDAO.getUserByUserId(userid);
		Bankaccountinfo bankaccountinfo=bankaccountinfoDAO.getById(bankId);
		if (bankaccountinfo==null){
			//银行卡号不存在
			System.out.println("银行卡号不存在");
			return "银行卡号不存在";
		} 
		if (!password.equals(Integer.toString(bankaccountinfo.getPassword()))){
			//密码错误
			System.out.println("密码错误");
			return "密码错误";
		}
		if (bankaccountinfo.getMoney()<rechargeNum){
			//余额不足
			System.out.println("余额不足");
			return "余额不足";
		}
		int balance=bankaccountinfo.getMoney()-rechargeNum;
		int result=bankaccountinfoDAO.updateMoney(balance,bankaccountinfo.getBankAccountId());
		if (result==-1){
			//修改金额失败
			System.out.println("修改金额失败");
			return "修改金额失败";
		}
		int nowBalance=rechargeNum+user.getMoney();
		result=userDAO.updateMoney(nowBalance, userid);
		if (result==-1){
			//修改金额失败
			System.out.println("修改金额失败");
			return "修改金额失败";
		}
		Recharge rechargeModel=new Recharge();
		rechargeModel.setBalance(nowBalance);
		rechargeModel.setCreateTime(new Date());
		rechargeModel.setRechargeNum(rechargeNum);
		rechargeModel.setUserId(userid);
		rechargeDAO.save(rechargeModel);
		
		//判断是否需要修改user的状态
		if (user.getStatus().equals("未激活") || user.getStatus().equals("暂停")){
			if (nowBalance>=200){
				user.setStatus("已激活");
				user.setTimeCount(getTimeCount());
			}
		}
		if (user.getStatus().equals("已激活")){
			if (nowBalance>=200){
				user.setTimeCount(getTimeCount());
			}
		}
		user.setScore(user.getScore()+rechargeNum);
		user.setSumPay(user.getSumPay()+rechargeNum);
		if (user.getSumPay()>=200){
			user.setLevel("黄金");
			user.setDiscount(9);
		}
		
		if (user.getSumPay()>=500){
			user.setLevel("白金");
			user.setDiscount(8);
		}
		
		if (user.getSumPay()>=1000){
			user.setLevel("钻石");
			user.setDiscount(7);
		}
		result=userDAO.updateStage(user);
		if (result==-1){
			//修改状态失败
			System.out.println("修改状态失败");
			return "修改状态失败";
		}
		return "success";
	}
	
	private boolean isInt(String str){
	    if(str.matches("[1-9]\\d*"))
	        return true;
	    return false;
	}

	//返回过期时间
	private String getTimeCount(){
		SimpleDateFormat format = new SimpleDateFormat("MM-dd");
		Date date=new Date();
		String timeCount=format.format(date);
		SimpleDateFormat format2 = new SimpleDateFormat("yyyy");
		String m=Integer.toString(Integer.parseInt(format2.format(date))+1);
		timeCount=m+'-'+timeCount;
		return timeCount;
	}

	public String cancelUser(Integer userid) {
		int result=userDAO.updateStatus(userid);
		if (result==-1){
			//修改状态失败
			System.out.println("修改状态失败");
			return "修改状态失败";
		}
		return "success";
	}

	public User changeToMoney(Integer userid) {
		User user=userDAO.getUserByUserId(userid);
		user.setMoney(user.getMoney()+Math.round(user.getScore()/10));
		user.setScore(0);
		int result=userDAO.updateStage(user);
		if (result==-1){
			//修改状态失败
			System.out.println("修改状态失败");
			return null;
		}
		return user;
	}

	public ArrayList<User> getAllUser() {
		return userDAO.getAll();
	}

	public ActivityVO fetchActivityByUserId(Integer userid) {
		ArrayList<Consumerecord> consumerecords=consumerecordDAO.getByUserId(userid);
		ArrayList<Plan> plans=new ArrayList<Plan>();
		for (Consumerecord c:consumerecords){
			Plan plan=planDAO.getById(Integer.toString(c.getPlanId()));
			plans.add(plan);
		}
		ArrayList<Question> questions=new ArrayList<Question>();
		for (Plan plan:plans){
			ArrayList<PlanWithQuestion> planWithQuestions=planWithQuestionDAO.getByFilmId(plan.getFilmId());
			for (PlanWithQuestion p:planWithQuestions){
				Question question=questionDAO.getById(p.getqId());
				if (question!=null){
					questions.add(question);
				}
			}
		}
		ActivityVO activityVO=new ActivityVO();
		activityVO.setQuestions(questions);
		return activityVO;
	}

	
}
