<!doctype html>
<%@page import="com.jspider.entities.Note"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Query"%>
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
body{
background-color: #e1bee7;
}
</style>
<title>Show Notes</title>
</head>
<body>
	<div class="container-fluid p-0 m-0">

		<!-- Directive tag is use to include navbar.jsp file -->
		<%@include file="Navbar.jsp"%>
		<br>
		<h1 style="text-align: center;">ALL NOTES..!</h1>

		<div class="row">


			<div class="col-12">

				<%
				Session session2 = FactoryProvider.getSessionFactory().openSession();
				Query query = session2.createQuery("from Note");
				List<Note> list = query.list();

				for (Note note : list) {
				%>
				<div class="card mt-3 text-center">
					<div class="img pt-4" style="margin: auto">
						<img class="card-img-top" src="Images/notes.png"
							style="max-width: 100px" alt="Card image cap">
					</div>

					<div class="card-body px-5">
						<h5 class="card-title"><%=note.getTitle()%></h5>
						<p class="card-text"><%=note.getContent()%></p>
						<p>
							<b class="text-primary"><%=note.getDate()%></b>
						</p>
						<a href="DeleteServlet?noteId=<%=note.getId()%>"
							class="btn btn-danger">Delete</a> <a
							href="UpdateNote.jsp?noteId=<%=note.getId()%>"
							class="btn btn-primary">Update</a>
					</div>
				</div>


				<%
				}

				session2.close();
				%>

			</div>
		</div>




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