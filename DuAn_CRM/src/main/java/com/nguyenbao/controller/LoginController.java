package com.nguyenbao.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.nguyenbao.common.Const;
import com.nguyenbao.pojo.Users;
import com.nguyenbao.service.UserService;

@WebServlet("/login")
public class LoginController extends HttpServlet {
		
	private UserService usersModel = new UserService();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		req.getRequestDispatcher("login.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		
		Users user = usersModel.getUsers(email, password);
		
		if(user != null) {
			HttpSession session = req.getSession();
			session.setAttribute(Const.sessionDemo, email);
			session.setMaxInactiveInterval(10000);
			
			resp.sendRedirect(req.getContextPath() + "/home");
		}else {
			req.getRequestDispatcher("login.jsp")
			.forward(req, resp);
		}
	}
}
