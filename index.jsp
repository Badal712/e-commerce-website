<%@ page language="java" contentType="text/html" import="java.sql.*" %>

<%!
	Connection conn;
	Statement stmt;
	ResultSet rs;
	String uID[], pass[];
	int i;
	
	public void doConnect(){
		try{
			Class.forName("com.mysql.jdbc.Driver");
		}
		catch(ClassNotFoundException cnfe){
			System.out.println("Unable to load driver "+cnfe);
		}
		try{
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ospdb","root","root");
		}
		catch(SQLException se){
			System.out.println("Unable to connect "+se);
		}
	}
%>

<%
	uID = new String[20];
	pass = new String[20];
	doConnect();
	
	try{
		stmt = conn.createStatement();
		rs = stmt.executeQuery("select * from tblosp");
		i = 0;
		
		while(rs.next()){
			uID[i] = rs.getString("User_ID");
			pass[i] = rs.getString("Password");
			i++;
		}
	}
	catch(SQLException se){
		out.println("Unable to collect data "+se);
	}
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Page</title>
    <link rel="stylesheet" href="login.css">
	<script language="javascript">
		function loginAdmin(){
			var juID, jpass;
			var enterID, enterPass;
			var i, j;
			
			juID = new Array();
			jpass = new Array();
			j = 0;
			
			<%
				i = 0;
				while(i < uID.length){
			%>
					juID[j] = "<%=uID[i]%>";
					jpass[j] = "<%=pass[i]%>";
					j++;
			<%
					i++;
				}
			%>
			//enterID = document.f1.UsID.value;
			//enterPass = document.f1.Pas.value;
			enterID = document.getElementById("uid").value;
			enterPass = document.getElementById("pid").value;
			j = 0;
			flag = 0;
			
			while(j < juID.length){
				if(juID[j].localeCompare(enterID)==0 && jpass[j].localeCompare(enterPass)==0){
					//window.open("Menu.html","_blank");
					window.location.href="Menu.html";
					flag=1;
					break;
				}
				j++;
			}
			if(flag==0){
				alert("Please enter valid User ID and Password");
			}
		}
	</script>
</head>
<body>
    <header>
        <h2 class="logo">One Stop Shop</h2>
        <nav class="navigation">
            <a href="About.html">About</a>
            <a href="reachus.html">Contact Us</a>
            <button class="btnLogin-popup">Login</button>
        </nav>
    </header>
    <div class="wrapper">
        
        <div class="form-box login">
            <h2>Login</h2>
       <!--     <form name="f1" action="" method="post">  -->
                <div class="input-box">
                    <span class="icon"><ion-icon name="person"></ion-icon></span>
                    <input type="text" name="UsID" id="uid" autocomplete="off" required>
                    <label>User ID</label>
                </div>
                <div class="input-box">
                    <span class="icon"><ion-icon name="lock-closed"></ion-icon></span>
                    <input type="password" name="Pas" id="pid" required>
                    <label>Password</label>
                </div>
                <div class="remember-forget">
                    <label><input type="checkbox">Remember me</label>
                    <a href="#">Forget Password?</a>
                </div>
                <button type="submit" class="btn" onclick="loginAdmin()">Login</button>
          <!--  </form>  -->
        </div>
    </div>

    <script crc="script.js"></script>
    <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
</body>
</html>