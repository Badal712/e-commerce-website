<%@ page language="java" contentType="text/html" import="java.sql.*" %>

<html>
	<head>
		<title>Organization Information saved</title>
		<script language = "javascript">
			function showAlert(){
				alert(<%=msg%>);
			}
		</script>
	</head>
	<body>
		<%!
			Statement stmtSave;
			Connection conn;
			String regdNo, date, orgName, headofOrg, local, city, state, phNo, mid, gstN, gstD, msg;
			
			public void doConnect() {
				
				try{
					Class.forName("com.mysql.jdbc.Driver");
				}
				catch(ClassNotFoundException cnfe){
					System.out.println("Unable to load Driver "+cnfe);
				}
				
				try{
					conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/ospdb","root","root");
				}
				catch(SQLException se){
					System.out.println("Unable to connect "+se);
				}
			}
		%>
		<%
			regdNo = request.getParameter("txtRegdNo");
			date = request.getParameter("dtDate");
			orgName = request.getParameter("txtOrgName");
			headofOrg = request.getParameter("txtHOrg");
			local = request.getParameter ("txtLocal");
			city = request.getParameter("txtCity");
			state = request.getParameter ("cmbState");
			phNo = request.getParameter("telPhoN");
			mid = request.getParameter("txtMail");
			gstN = request.getParameter("txtGST");
			gstD = request.getParameter ("dtGST");
			
			doConnect();
			
			try{
				stmtSave=conn.createStatement();
				stmtSave.executeUpdate("insert into tblorgn value('"+regdNo+"','"+date+"','"+orgName+"','"+headofOrg+"','"+local+"','"+city+"','"+state+"','"+phNo+"','"+mid+"','"+gstN+"','"+gstD+"')");
				
				//Code for show alert
				
				out.println("<script type='text/javaScript'>");
				out.println("alert("+"'Your Data Saved Successfully...'"+");\n");
				out.println("setTimeout(function(){window.location.href='OSP_Orgnc.html'},10);");
				out.println("</script>\n");
			}
			catch(SQLException sqle){
				out.println("Unable to save your data "+sqle);
			}
		%>
	</body>
</html>