package it.ohmybag.controller;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import it.ohmybag.bean.*;


public class AdminFilter extends HttpFilter implements Filter {

	public AdminFilter() {
		super();
		// TODO Auto-generated constructor stub
	}

	public void destroy() {
		// TODO Auto-generated method stub
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		
		HttpServletRequest hrequest = (HttpServletRequest) request;
		HttpServletResponse hresponse = (HttpServletResponse) response;

		Utente u = (Utente) hrequest.getSession().getAttribute("utente");

		// Controlla se l'utente è autenticato e se è amministratore
		if ((u != null)) {
			if (u.isAdmin())
				// L'utente è amministratore, continua la catena del filtro
				chain.doFilter(request, response);
			else
				hresponse.sendError(401);

		} else
			hresponse.sendError(401);
	}

	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}