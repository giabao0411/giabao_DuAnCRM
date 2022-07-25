package com.nguyenbao.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nguyenbao.model.JoinTasks;
import com.nguyenbao.pojo.Jobs;
import com.nguyenbao.pojo.Tasks;
import com.nguyenbao.pojo.Users;
import com.nguyenbao.service.JobsService;
import com.nguyenbao.service.TaskService;
import com.nguyenbao.service.UserService;

@WebServlet(name = "file", urlPatterns = {"/profile"})
public class ProfileController extends HttpServlet{
	
	TaskService taskService = new TaskService();
	UserService userService = new UserService();
	JobsService jobsService = new JobsService();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		resp.setContentType("text/html;charset=UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		String path = req.getServletPath();
		switch (path) {
			case "/profile":
				List<JoinTasks> list = taskService.getListTask();
				req.setAttribute("list", list);
				List<Users> listUser = userService.getListUser();
				req.setAttribute("listUser", listUser);
				List<Jobs> listJob = jobsService.getListJobs();
				req.setAttribute("listJob", listJob);
				req.getRequestDispatcher("profile.jsp").forward(req, resp);
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
			case "/task-update":
				Tasks uTasks = new Tasks();
				uTasks.setTaskname(req.getParameter("taskname"));
				uTasks.setUser_id(Integer.parseInt(req.getParameter("user_id")));
				uTasks.setJob_id(Integer.parseInt(req.getParameter("job_id")));
				uTasks.setId(Integer.parseInt(req.getParameter("id")));
				if (taskService.updateTask(uTasks) != false) {
					resp.sendRedirect(req.getContextPath() + "/profile");	
				} else {
					resp.sendRedirect(req.getContextPath() + "/404.jsp");
					System.out.println("Unfixable");
				}
				break;
			default:
				break;
		}
	}
}
