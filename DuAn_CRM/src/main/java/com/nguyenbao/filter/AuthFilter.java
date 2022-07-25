package com.nguyenbao.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.nguyenbao.common.Const;



@WebFilter(urlPatterns = {"/login"})
public class AuthFilter implements Filter {

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void doFilter(ServletRequest arg0, ServletResponse arg1, FilterChain arg2)
			throws IOException, ServletException {
		// TODO Auto-generated method stub
		
		
		HttpServletResponse resp = (HttpServletResponse)arg1;
		HttpServletRequest req = (HttpServletRequest) arg0;
		
		//HttpSession session = req.getSession();
		if(!req.getServletPath().startsWith("/login")) {
			if(req.getSession().getAttribute(Const.sessionDemo) != null) {				
				resp.sendRedirect(req.getContextPath() + "/home");
				}
		}else {
			arg2.doFilter(arg0, arg1);
		}
		
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub
		
	}

}
