package com.ft.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import javax.servlet.ServletException;
import javax.servlet.annotation.*;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.ft.model.File;
import com.ft.service.FileBean;


//...import statements

	@WebServlet(name = "AddNewFileServlet", urlPatterns = {"/AddNewFileServlet"})
	public class AddNewFileServlet extends HttpServlet {
	 
	    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	SimpleDateFormat format = new SimpleDateFormat("dd/MM/yyyy");

		protected void processRequest(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {

			File file = new File();
//	        file.setFile_id(Integer.parseInt(request.getParameter("fileId")));
	        file.setFile_name(request.getParameter("fileName"));
	        file.setFile_no(request.getParameter("fileNo"));
	        file.setFile_type(request.getParameter("fileType"));
	        file.setDescription(request.getParameter("description"));
	        file.setOwner_dept(Integer.parseInt(request.getParameter("ownerDept")));
	        file.setOwner_sec(Integer.parseInt(request.getParameter("ownerSec")));
	        file.setOwner(Integer.parseInt(request.getParameter("owner")));
	        file.setFrom_section(Integer.parseInt(request.getParameter("ownerSec")));
	        file.setTo_section(Integer.parseInt(request.getParameter("ownerSec")));
	        file.setFrom_user(Integer.parseInt(request.getParameter("owner")));
	        file.setTo_user(Integer.parseInt(request.getParameter("owner")));
	        file.setPriority(Integer.parseInt(request.getParameter("priority")));
	        try {
				file.setCreated_date(  convertJavaDateToSqlDate(format.parse(request.getParameter("createdDate"))));
			} catch (ParseException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
				System.out.println("createdDate :" + request.getParameter("createdDate"));
	        try {
				System.out.println(" date "+ format.parse(request.getParameter("createdDate")));
			} catch (ParseException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
//	        file.setStatus(Integer.parseInt(request.getParameter("status")));
	        try {
				file.setDue_date( convertJavaDateToSqlDate(format.parse(request.getParameter("dueDate"))));
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	        file.setTags(request.getParameter("tags"));
	        file.setRemarks(request.getParameter("remarks"));
	        FileBean eb = new FileBean();
	        eb.addNew(file);
	        response.sendRedirect("fileView.jsp");
	 
	    }
	 
	    @Override
	    protected void doGet(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {
	        processRequest(request, response);
	    }
	 
	    @Override
	    protected void doPost(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {
	        processRequest(request, response);
	    }
	 
	    @Override
	    public String getServletInfo() {
	        return "Short description";
	    }

	    public java.sql.Date convertJavaDateToSqlDate(java.util.Date date) {
	        return new java.sql.Date(date.getTime());
	    }
}
