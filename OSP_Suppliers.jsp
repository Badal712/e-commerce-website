<%@ page language="java" contentType="text/html" import="java.sql.*"%>
<html>
	<head>
		<title>Supplier Information</title>
	</head>
	<body>
		<%!
			Connection conn;
			Statement stmt, stmtArray;
			ResultSet rsArray;
			String supID, supName, conPer, local, city, state, phNo, mid, gstN, gstD,dbSupID;
			int i;
			
			public void doConnect(){
				
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
					System.out.println("unable to connect "+se);
					
				}
			}
		%>
		
		<%
			supID = request.getParameter("txtSupID");
			supName = request.getParameter("txtSupName");
			conPer = request.getParameter("txtContactPer");
			local = request.getParameter("txtLocal");
			city = request.getParameter("txtCity");
			state = request.getParameter("cmbState");
			phNo = request.getParameter("telPhone");
			mid = request.getParameter("txtMail");
			gstN = request.getParameter("txtGSTN");
			gstD = request.getParameter("dtGSTD");
			
			try{												//check for unique id
				doConnect();
				stmtArray = conn.createStatement();
				rsArray = stmtArray.executeQuery("select * from tblsup where Supplier_ID = '"+supID+"'");
				
				if(!rsArray.next()){
					stmt=conn.createStatement();
					stmt.executeUpdate("insert into tblsup value('"+supID+"','"+supName+"','"+conPer+"','"+local+"','"+city+"','"+state+"','"+phNo+"','"+mid+"','"+gstN+"','"+gstD+"')");
					
					//Code for show alert
				
					out.println("<script type='text/javaScript'>");
					out.println("alert("+"'Your Data Saved Successfully...'"+");\n");
					out.println("setTimeout(function(){window.location.href='OSP_Supplierc.html'},10);");
					out.println("</script>\n");
				}
				else{
					//Code for show alert
				
					out.println("<script type='text/javaScript'>");
					out.println("alert("+"'Supplier ID is available'"+");\n");
					out.println("setTimeout(function(){window.location.href='OSP_Supplierc.html'},10);");
					out.println("</script>\n");
				}
			}
			catch(SQLException sqle){
				out.println("Unable to save your data "+sqle);
			}
			/*
			try {
				stmt=conn.createStatement();
				stmt.executeUpdate("insert into tblsup value('"+supID+"','"+supName+"','"+conPer+"','"+local+"','"+city+"','"+state+"','"+phNo+"','"+mid+"','"+gstN+"','"+gstD+"')");
				
				//Code for show alert
				
				out.println("<script type='text/javaScript'>");
				out.println("alert("+"'Your Data Saved Successfully...'"+");\n");
				out.println("setTimeout(function(){window.location.href='OSP_Supplierc.html'},10);");
				out.println("</script>\n");
			}
			catch(SQLException se){
				out.println("Unable to save your data "+sqle);
			}
			*/
		%>
	</body>
</html>