package com.mysechko.hotelbooking.web;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysechko.hotelbooking.commands.Command;
import com.mysechko.hotelbooking.commands.CommandExecutor;


public class DispatcherServlet extends HttpServlet {
	
	private static String JSP_PREFIX = "WEB-INF/jsp/";
	private static String JSP_SUFFIX = ".jsp";

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		handleRequest(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		handleRequest(request, response);
	}

	private void handleRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		Command command = CommandExecutor.getCommand(request);
		String view = command.execute(request, response);
		dispatch(view, request, response);
	}

	private void dispatch(String view, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String path = JSP_PREFIX + view + JSP_SUFFIX;
		RequestDispatcher dispatcher = request.getRequestDispatcher(path);
		dispatcher.forward(request, response);
	}
}
