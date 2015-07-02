

package com.film.action;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import com.film.model.Film;
import com.film.service.FilmService;
import com.film.service.UserService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class AddFilmAction extends ActionSupport {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private FilmService filmService;
	private UserService userService;
	private File file;// 上传文件的file对象
	private String fileFileName;// 上传文件的名称
	private String fileContentType;// 上传文件的MIME类型
	// private String description;// 上传的描述信息
	// private String uploadDir;// 保存上传文件的目录
	private final int MAX_SIZE=5*1024*1024;

	/*
	 * Action的默认执行方法
	 */
	public String execute() {
		System.out.println("excute()");
		HttpServletRequest request = ServletActionContext.getRequest(); // 获取request
		Film film=new Film();
		Date date = new Date();
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd-HH-mm-ss");
		film.setCreateTime(date);
		// System.out.println(date.toGMTString());
		// System.out.println(date.toString());
//		 System.out.println(format.format(date));
//		 String[] strings=fileContentType.split("/");
//		 System.out.println(strings.length);
		// 照片
		System.out.println(getFileFileName());
		 System.out.println(this.getFileContentType());
		// 判断图片类型
		if (fileContentType != null) {
			if (!fileContentType.equals("image/png") && !fileContentType.equals("image/bmp")
					&& !fileContentType.equals("image/jpeg")
					&& !fileContentType.equals("image/gif")) {
				request.setAttribute("message", "文件非图片类型");
				return "regFail";
			}
		}
		String fileNameNew=null;
		// 存储图片
		String realpath = ServletActionContext.getServletContext().getRealPath(
				"/images");
		System.out.println("Real Path : " + realpath);
		if (file != null) {
			System.out.println(file.length());
			if (file.length()>MAX_SIZE){
				request.setAttribute("message", "图片过大，已超过5M");
				return "regFail";
			}
			File savedir = new File(realpath);
			if (!savedir.exists()) {
				savedir.mkdirs();
			}
			// File savefile = new File(realpath, this.imageFileName ) ;
			// System.out.println(fileFileName);
			// String[] aStrings=fileFileName.split(".");
			// System.out.println(aStrings.length);
			fileNameNew=Math.random()+"-"+format.format(date)+"."+fileContentType.split("/")[1];
//			System.out.println(fileNameNew);
			File savefile = new File(realpath, fileNameNew);
			try {
				FileUtils.copyFile(file, savefile);
			} catch (Exception e) {
				System.out.println("上传失败");
				e.printStackTrace();
				request.setAttribute("message", "图片上传失败");
				return "regFail";
			}
//			System.out.println(fileContentType);

			ActionContext.getContext().put("message", "上传成功：" + realpath);

		}
		// 个人信息
		film.setName(request.getParameter("name"));
		film.setDirector(request.getParameter("director"));
		film.setActor(request.getParameter("actor"));
		film.setPrice(80);
		film.setType(request.getParameter("type"));
		film.setTime(120);
		film.setState(1);
		film.setDescription(request.getParameter("description"));
		film.setPhoto("images/"+fileNameNew);

		int result = filmService.saveFilm(film);
		if (result == -1) {
			request.setAttribute("message", "信息存储失败");
			return "regFail";
		} else {
			return "regSuccess";
		}
	}


	public File getFile() {
		return file;
	}

	public void setFile(File file) {
		this.file = file;
	}

	public String getFileFileName() {
		return fileFileName;
	}

	public void setFileFileName(String fileFileName) {
		this.fileFileName = fileFileName;
	}

	public String getFileContentType() {
		return fileContentType;
	}

	public void setFileContentType(String fileContentType) {
		this.fileContentType = fileContentType;
	}

	public void setFilmService(FilmService filmService) {
		this.filmService = filmService;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	
	

}
