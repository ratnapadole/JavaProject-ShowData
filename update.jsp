
<%@ page import = "java.sql.*"  %>

<%    
	String name = request.getParameter("ename");
	String address = request.getParameter("eaddress");
	String dob = request.getParameter("edob");
	String loginId = request.getParameter("eloginId");
	String password = request.getParameter("epassword");
	String gender = request.getParameter("egender");
		//out.println("<h1>Record is Deleted </h1>"+loginId+gender+password+dob+address+name);
		
		
		//out.println("<h1>Record is Deleted </h1> =  "+loginId);
	Class.forName("com.mysql.jdbc.Driver");
	Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/emp","root","root");
	
	Statement st =con.createStatement();
	 
    String query="update empregistration set emp_name='"+name+"',emp_address='"+address+"',emp_DOB='"+dob+"',emp_gender='"+gender+"',emp_password='"+password+"' where emp_loginid='" + loginId + "' ";
				
	st.executeUpdate(query);  
		
		
	con.close();
%>



<script>
	window.location.href = "http://localhost:4343/JavaProject-ShowData/home.jsp";	


	 		 
</script>