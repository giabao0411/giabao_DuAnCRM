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

@WebServlet(name = "task", urlPatterns = {"/task","/task-add","/task-update","/task-delete"})
public class TaskController extends HttpServlet{
	
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
				case "/task":
					List<JoinTasks> listtask = taskService.getListTask();
					req.setAttribute("listtask", listtask);
					List<Users> listUsers = userService.getListUser();
					req.setAttribute("listUsers", listUsers);
					List<Jobs> listJobs = jobsService.getListJobs();
					req.setAttribute("listJobs", listJobs);
					req.getRequestDispatcher("task.jsp").forward(req, resp);
					break;
				case "/task-delete":
					int idxoa = Integer.parseInt(req.getParameter("delete"));
					taskService.deleteTask(idxoa);
					resp.sendRedirect(req.getContextPath()	+ "/task");
					break;
				case "/task-add":
					List<Users> listuser = userService.getListUser();
					req.setAttribute("listuser", listuser);
					List<Jobs> listproject = jobsService.getListJobs();
					req.setAttribute("listproject", listproject);
					req.getRequestDispatcher("task-add.jsp").forward(req, resp);
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
			case "/task-add":			
				Tasks task = new Tasks();
				task.setTaskname(req.getParameter("taskname"));
				task.setUser_id(Integer.parseInt(req.getParameter("user_id")));
				task.setJob_id(Integer.parseInt(req.getParameter("job_id")));			
				if(taskService.addTask(task) != false ) {
					resp.sendRedirect(req.getContextPath()	+ "/task");
				}else {
					resp.sendRedirect(req.getContextPath()	+ "/404.jsp");
					System.out.println("Can't add");
				}			
				break;
			case "/task-update":
				Tasks uTasks = new Tasks();
				uTasks.setTaskname(req.getParameter("taskname"));
				uTasks.setUser_id(Integer.parseInt(req.getParameter("user_id")));
				uTasks.setJob_id(Integer.parseInt(req.getParameter("job_id")));
				uTasks.setId(Integer.parseInt(req.getParameter("id")));
				if (taskService.updateTask(uTasks) != false) {
					resp.sendRedirect(req.getContextPath() + "/task");	
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
