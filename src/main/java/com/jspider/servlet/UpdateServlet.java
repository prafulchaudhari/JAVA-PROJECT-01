package com.jspider.servlet;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.jspider.entities.Note;
import com.jspider.singltonsessionfactory.FactoryProvider;

public class UpdateServlet extends HttpServlet {

	
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			int noteId=Integer.parseInt(request.getParameter("noteId").trim());
			
			Session session=FactoryProvider.getSessionFactory().openSession();
			
			Transaction transaction=session.beginTransaction();
			
			Note note=session.get(Note.class, noteId);
			
			note.setTitle(title);
			note.setContent(content);
			note.setDate(new Date());
			
			transaction.commit();
			
			session.close();
			
			response.sendRedirect("ShowNotes.jsp");

			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
