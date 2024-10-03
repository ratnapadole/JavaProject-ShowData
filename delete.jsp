


<%@ page import = "java.sql.*"  %>

<script>
	 window.location.href = "http://localhost:4343/JavaProject-ShowData/home.jsp";		
</script>

<%  
 String empLoginID = request.getParameter("deleteId");
			
		Class.forName("com.mysql.jdbc.Driver");
		Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/emp","root","root");
		
		Statement st =con.createStatement();
		String query="delete from empregistration where emp_loginid='" + empLoginID + "' ";
			
		st.executeUpdate(query);  
	//	out.println("<h1>Record is Deleted </h1>");
		
		con.close();
%>