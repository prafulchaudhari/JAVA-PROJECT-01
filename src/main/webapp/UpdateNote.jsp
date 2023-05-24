<!doctype html>
<%@page import="com.jspider.entities.Note"%>
<%@page import="com.jspider.singltonsessionfactory.FactoryProvider"%>
<%@page import="org.hibernate.Session"%>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link rel="stylesheet" href="Css/Style.css">
<style>
body {
	background-color: #e1bee7;
}

</style>
<title>Update Note</title>
</head>
<body>
	<div class="container-fluid p-0 m-0 text-center">

		<!-- Directive tag is use to include navbar.jsp file -->
		<%@include file="Navbar.jsp"%>
		<h1>Please Update Note...!</h1>
		<br>

		<%
		int noteId = Integer.parseInt(request.getParameter("noteId").trim());

		Session session2 = FactoryProvider.getSessionFactory().openSession();

		Note note = (Note)session2.get(Note.class, noteId);

		session2.close();
		%>
		<form action="UpdateServlet" method="post">
		
		<input value="<%= note.getId()%>" name="noteId" type="hidden"/>
		
			<div class="form-group text-center">
				<label for="title">Note Title</label> <input type="text"
					class="form-control" 
					id="title" name="title"
					placeholder="Enter Title You Want...!"
					 required="required" 
					 value="<%=note.getTitle()%>"/>
			</div>
			<div class="form-group text-center">
				<label for="content">Note Content</label>
				<textarea id="content"
				 placeholder="Enter Content Here....!"
					class="form-control" 
					style="height: 200px" 
					required="required"
					name="content"><%=note.getContent() %> </textarea>
			</div>

			<div class="container text-center">
				<button type="submit" class="btn btn-success">Save Update Note</button>
			</div>
		</form>

	</div>

	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
		integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>
</body>
</html>