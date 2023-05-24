package com.jspider.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.jspider.entities.Note;
import com.jspider.singltonsessionfactory.FactoryProvider;

public class DeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		int noteId=Integer.parseInt(request.getParameter("noteId").trim());
		
		Session session=FactoryProvider.getSessionFactory().openSession();
		Transaction transaction=session.beginTransaction();
		
	    Note note=(Note)session.find(Note.class, noteId);
	    
	    session.delete(note);
		transaction.commit();
		session.close();
		response.sendRedirect("ShowNotes.jsp");
	}



}
