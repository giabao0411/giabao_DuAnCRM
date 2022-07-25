package com.nguyenbao.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nguyenbao.pojo.Jobs;
import com.nguyenbao.service.JobsService;


@WebServlet(name = "groupwork", urlPatterns = {"/jobs-table","/jobs-add","/jobs-update","/jobs-delete","/jobs-details"})
public class JobsController extends HttpServlet {
	
	JobsService jobsService = new JobsService();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		resp.setContentType("text/html;charset=UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		String path = req.getServletPath();
		switch (path) {
			case "/jobs-table":
				List<Jobs> list = jobsService.getListJobs();
				req.setAttribute("list", list);
				req.getRequestDispatcher("groupwork.jsp").forward(req, resp);
				break;
			case "/jobs-add":
				req.getRequestDispatcher("groupwork-add.jsp").forward(req, resp);
				break;
			case "/jobs-delete":
				int idDelete = Integer.parseInt(req.getParameter("delete"));
				jobsService.deleteJobs(idDelete);
				resp.sendRedirect(req.getContextPath() + "/jobs-table");
				break;
			case "/jobs-details":
				int idSeen = Integer.parseInt(req.getParameter("seen"));
				Jobs jobs = jobsService.getJobsById(idSeen);
				req.setAttribute("jobs", jobs);
				req.getRequestDispatcher("groupwork-details.jsp").forward(req, resp);
				break;
			default:
				break;
		}
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		req.setCharacterEncoding("UTF-8");
		String path = req.getServletPath();
		switch (path) {
			case "/jobs-add":	
				Jobs new_jobs = new Jobs();			
				new_jobs.setName(req.getParameter("name"));
				new_jobs.setStart_date(Date.valueOf(req.getParameter("start_date")));
				new_jobs.setEnd_date(Date.valueOf(req.getParameter("end_date")));
				if(jobsService.addJobs(new_jobs) != false ) {
					resp.sendRedirect(req.getContextPath()	+ "/jobs-table");
				}else {
					resp.sendRedirect(req.getContextPath()	+ "/404.jsp");
					System.out.println("Can't add" + Date.valueOf(path));
				}			
				break;
			case "/jobs-update":	
				Jobs update_jobs = new Jobs();	
				update_jobs.setId(Integer.parseInt(req.getParameter("id")));
				update_jobs.setName(req.getParameter("name"));
				update_jobs.setStart_date(Date.valueOf(req.getParameter("start_date")));
				update_jobs.setEnd_date(Date.valueOf(req.getParameter("end_date")));
				if(jobsService.updateJobs(update_jobs) != false ) {
					resp.sendRedirect(req.getContextPath()	+ "/jobs-table");
				}else {
					resp.sendRedirect(req.getContextPath()	+ "/404.jsp");
					System.out.println("Unfixable");
				}									
				break;
			default:
				break;
		}
	}
}
