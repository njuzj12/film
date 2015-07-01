package com.film.schedule;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.film.dao.UserDAO;
import com.film.model.User;
import com.film.service.UserService;

@Component("scheduledTaskManager")
public class Update {
	UserDAO userDAO;

	/**
	 * cron表达式：* * * * * *（共6位，使用空格隔开，具体如下） cron表达式：*(秒0-59) *(分钟0-59) *(小时0-23)
	 * *(日期1-31) *(月份1-12或是JAN-DEC) *(星期1-7或是SUN-SAT)
	 */

	/**
	 * 定时卡点计算。以配置文件为准
	 */
	@Scheduled(cron = "0 0 2 * * *")
	public void autoCardCalculate() {
		System.out.println("定时卡点计算... " + new Date());
		ArrayList<User> users = userDAO.getAll();
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String timeCount = format.format(date);
		for (User user : users) {
			if (user.getStatus().equals("停止")) {
				continue;
			}
//			System.out.println("nowTime=" + timeCount);
//			System.out.println("countTime=" + user.getTimeCount());
//			System.out.println("result="
//					+ timeCount.compareTo(user.getTimeCount()));
			int result = timeCount.compareTo(user.getTimeCount());
			if (result == 1) {
				if (user.getStatus().equals("未激活")
						|| (user.getStatus().equals("暂停"))) {
					System.out.println("userid="+user.getUserId());
					System.out.println("状态由"+user.getStatus()+ "改为 停止");
					user.setStatus("停止");
					userDAO.updateStage(user);
				}
				if (user.getStatus().equals("已激活")) {
					System.out.println("userid="+user.getUserId());
					System.out.println("状态由 已激活 改为 暂停");
					user.setStatus("暂停");
					user.setTimeCount(getTimeCount());
					userDAO.updateStage(user);
				}
			}
		}
	}

	/**
	 * 心跳更新。启动时执行一次，之后每隔1分钟执行一次
	 */
	// @Scheduled(fixedRate = 1000*60*1)
	// public void updateUserStatus() {
	// System.out.println("心跳更新... " + new Date());
	// ArrayList<User> users=userDAO.getAll();
	// for (User user:users){
	//
	// }
	// }

	public void setUserDAO(UserDAO userDAO) {
		this.userDAO = userDAO;
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
}
