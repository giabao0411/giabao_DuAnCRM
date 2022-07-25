package com.nguyenbao.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nguyenbao.pojo.Users;
import com.nguyenbao.service.UserService;

@WebServlet(name = "/user", urlPatterns = {"/user-table","/user-details","/user-add","/user-update","/user-delete"})
public class UserController extends HttpServlet {
	
	UserService userService = new UserService();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		resp.setContentType("text/html;charset=UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		String path = req.getServletPath();
		switch (path) {
		case "/user-add":
			req.getRequestDispatcher("user-add.jsp").forward(req, resp);
			break;
		case "/user-delete":
			int idxoa = Integer.parseInt(req.getParameter("xoa"));
			userService.deleteUser(idxoa);		
			resp.sendRedirect(req.getContextPath()	+ "/user-table");
			break;
		case "/user-table":
			List<Users> list = userService.getListUser();
			req.setAttribute("list", list);
			req.getRequestDispatcher("user-table.jsp").forward(req, resp);
			break;
		case "/user-details":
			int idxem = Integer.parseInt(req.getParameter("xem"));
			Users user = userService.getUserById(idxem);
			req.setAttribute("user", user);
			req.getRequestDispatcher("user-details.jsp").forward(req, resp);
			break;
		default:
			break;
		}			
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		resp.setContentType("text/html;charset=UTF-8");
		req.setCharacterEncoding("UTF-8");
		String path = req.getServletPath();
		switch (path) {
		case "/user-add":	
			Users new_user = new Users();			
			new_user.setFullname(req.getParameter("fullname"));
			new_user.setEmail(req.getParameter("email"));
			new_user.setPassword(req.getParameter("password"));
			new_user.setPhone(Integer.parseInt(req.getParameter("phone")));
			new_user.setAddress(req.getParameter("address"));
			if(userService.addUser(new_user) != false ) {
				resp.sendRedirect(req.getContextPath()	+ "/user-table");
			}else {
				resp.sendRedirect(req.getContextPath()	+ "/404.jsp");
				System.out.println("Can't add");
			}			
			break;
		case "/user-update":	
			Users update_user = new Users();			
			update_user.setFullname(req.getParameter("fullname"));
			update_user.setEmail(req.getParameter("email"));
			update_user.setPhone(Integer.parseInt(req.getParameter("phone")));
			update_user.setAddress(req.getParameter("address"));
			update_user.setId(Integer.parseInt(req.getParameter("id")));
			System.out.println(update_user.getEmail());
			if(userService.updateUser(update_user) != false ) {
				resp.sendRedirect(req.getContextPath()	+ "/user-table");
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
