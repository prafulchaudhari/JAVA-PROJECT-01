package com.jspider.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.jspider.entities.Note;
import com.jspider.singltonsessionfactory.FactoryProvider;

public class SaveServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {
			
			String title=request.getParameter("title");
			String content=request.getParameter("content");
		
			Note note=new Note();
			note.setTitle(title);
			note.setContent(content);
			note.setDate(new Date());
		
			Session session=FactoryProvider.getSessionFactory().openSession();
			
			Transaction transaction=session.beginTransaction();
			
			session.save(note);
			
			transaction.commit();
			
			session.close();
			
			response.setContentType("text/html");
			PrintWriter printWriter=response.getWriter();
			printWriter.println("<h1 style=text-align:center;>Note is Added Successfully....!</h1>");
			printWriter.println("<h1 style=text-align:center;><a href='ShowNotes.jsp'>View All Notes...!</a></h1>");
			

		} catch (Exception e) {

			e.printStackTrace();
		}
	}

}
