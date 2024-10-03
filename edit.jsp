

<%
    String name = request.getParameter("ename");
	String address = request.getParameter("address");
	String dob = request.getParameter("dob");
	String loginId = request.getParameter("loginId");
	String password = request.getParameter("password");
	String gender = request.getParameter("gender");
%>

<html>
	
<head>
   
	<style> .headstyle{font-size:20; text-align: center;}
			.fstyle{ font-weight : bold;  border :2px solid red;text-align: center;width:500; background-color:orange;}
	</style>
   
<script>
	 window.onload = function() {
		document.getElementById("ename").value = "<%= name %>";
		document.getElementById("eaddress").value = "<%= address %>";
	    document.getElementById("edob").value = "<%= dob %>";
	    document.getElementById("eloginId").value = "<%= loginId %>";
	    document.getElementById("epassword").value = "<%= password %>";
	    
		// For radio buttons (gender)
		var gender = "<%= gender %>"; // Gender value from JSP
		//alert();
		if (gender === "male") {
			document.getElementById("male").checked = true;
		} else if (gender === "female") {
			document.getElementById("female").checked = true;
		} else if (gender === "others") {
			document.getElementById("others").checked = true;
		}
		 
	 };

	 function  redirectLoadPage(){	 
		window.location.href = "http://localhost:4343/JavaProject-ShowData/home.jsp";	
	 }	

	 function  updateData(loginId){
		// window.location.href = "http://localhost:4343/JavaProject-ShowData/update.jsp?uloginID=" + loginId;

	
		// window.location.href = "http://localhost:4343/JavaProject-ShowData/update.jsp?name=" + name;
		alert("Data Update Successfully");
		
	 }		 
</script>
</head>			
<body> 
	<center> 
	<h1>Update Employee Registration Form</h1><br>
		<form  action="update.jsp" method="post" >
		
		<div class="fstyle">
			EMP Name: <br>
			<input type="text"  id="ename" name="ename" required autofocus placeholder="enter emp name"><br>
			EMP Address: <br>
			<input type="text" id="eaddress" name="eaddress" required autofocus placeholder="enter emp address"><br>
			
			EMP DOB: <br>
			<input type="date" id="edob" name="edob" required autofocus ><br>
			
			EMP Gender: <br>
			<input type="radio" name="egender" value="male"id="male" required autofocus >Male
			<input type="radio" name="egender" value="female" id="female" required autofocus >Female
			<input type="radio" name="egender" value="others" id="others" required autofocus >Others<br>
			
			EMP LoginId: <br>
			<input type="text" id="eloginId" name="eloginId" required autofocus placeholder="enter emp loginId"><br>
			EMP Password: <br>
			<input type="password" id="epassword" name="epassword" required autofocus placeholder="enter password"><br><br>
					
			<button  onclick="updateData('<%= loginId %>');"> Update </button>	 &nbsp; &nbsp; &nbsp; &nbsp;
			
			<button onclick="redirectLoadPage();"> Cancel </button> <br><br>
		</form>
		</div>	
	</center>
</body>
</html>










































