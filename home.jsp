



<%@ page import = "java.sql.*"  %>
<%@ page import="java.text.SimpleDateFormat, java.util.*" %>
<%@ page import="java.text.SimpleDateFormat, java.text.ParseException, java.util.Date" %>




<html>
<head>
	<script>
		function deleteRecord(empLoginID){
			
			let result = confirm("Do you want to delete this record?");
			
			if (result) {
				// Set the hidden input value to empLoginID (just in case)
				document.getElementById("deleteId").value = empLoginID;
				//alert("Deleted Successfully");
				// Submit the form programmatically
				document.getElementById("deleteForm").submit();
				//window.location.reload();
				
			}else{
					
			}
		}
		
		function editRecord(ename,eaddress,dob,eloginId,password,gender){
			//document.getElementById("editForm").submit(); 
			//window.location.href  = "http://localhost:4343/JavaProject-ShowData/edit.jsp";
			
			
		 window.location.href = "http://localhost:4343/JavaProject-ShowData/edit.jsp?ename=" + ename+"&address="+eaddress+"&dob="+dob+"&loginId="+eloginId+"&password="+password+"&gender="+gender;

		
		}
		
	</script>
</head>
<body>

	<form  action="" method="get" >
		<center> <h1>Java Project-Show Data</h1> </center> 
		<table   border=1 align="center" bordercolor="#003366" cellspacing=0 cellpadding=20 >   
		   <tr>
		
				<center> 
				<th>Emp Name</th>
				<th>Emp DOB</th>
				<th> Gender</th>
				<th>Emp Address</th> 
				<th>Emp LoginID</th>
				<th>Emp Password</th>
				</center> 
			</tr>
			
			
			
			<%  
			
				Class.forName("com.mysql.jdbc.Driver");
				Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/emp","root","root");
				
					Statement st =con.createStatement();
					
					
					String query="Select * from empregistration ";
					
					ResultSet rs =st.executeQuery(query);
					while(rs.next())
					{
						String empDOB = rs.getString("emp_DOB");

						 // Parse the date string into a Date object
						SimpleDateFormat inputFormat = new SimpleDateFormat("yyyy-MM-dd");  // This should match the format in the database
						SimpleDateFormat outputFormat = new SimpleDateFormat("dd/MM/yyyy"); // Desired output format

						String formattedDOB = "";
						try {
							// Parse and format the date
							  java.util.Date date = inputFormat.parse(empDOB);  // Explicitly use java.util.Date
							  formattedDOB = outputFormat.format(date);
						} catch (ParseException e) {
							e.printStackTrace();
							formattedDOB = empDOB; // Fallback to the original value if parsing fails
						}
			%>
			
				<tr>
					<td><%= rs.getString("emp_name")  %></td>
					<td><%= formattedDOB  %></td>
					<td><%= rs.getString("emp_gender")  %></td>
					<td><%= rs.getString("emp_address")  %></td>
					<td><%= rs.getString("emp_loginId")  %></td>
					<td   style=" width: 250px; " ><%= rs.getString("emp_password")  %>  
						<form id="deleteForm" action="delete.jsp" method="post">
							<input type="hidden" name="deleteId" id="deleteId" value="<%= rs.getString("emp_loginId") %>">
							<button type="button" onclick="deleteRecord('<%= rs.getString("emp_loginId") %>');">
								<img src="image/deleteIcon.png" height="31">
							</button>
						</form>	
						<form id="editForm" action="edit.jsp" method="post">
							<button type="button" onclick="editRecord('<%= rs.getString("emp_name") %>','<%= rs.getString("emp_address") %>','<%= rs.getString("emp_DOB") %>','<%= rs.getString("emp_loginId") %>','<%= rs.getString("emp_password") %>','<%= rs.getString("emp_gender") %>');">
								<img src="image/edit.png"height="31">
							</button>
						</form>
					</td>
				</tr>
			<%
			
				}	
				con.close();		
			%>
			
					
			
		
				
		</table>				
	</form>         
</body>
</html>










































