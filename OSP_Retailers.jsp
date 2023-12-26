<%@ page language="java" contentType="text/html" import="java.sql.*" %>
<html>
	<head>
		<title>Retailer Information</title>
	</head>
	<body>
		<%!
			Statement stmt;
			Connection conn;
			ResultSet rsRetID;
			String retID, retName, conPer, local, ct, st, phNo, mid, gstN, gstD, pass, rePass, pto;
			
			public void doConnect(){
				
				try{
					Class.forName("com.mysql.jdbc.Driver");
				}
				catch(ClassNotFoundException cnfe){
					System.out.println("Unable to load Driver "+cnfe);
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
			retID = request.getParameter("txtRetID");
			retName = request.getParameter("txtRetName");
			conPer = request.getParameter("txtConPer");
			local = request.getParameter("txtLocal");
			ct = request.getParameter("txtCity");
			st = request.getParameter("cmbState");
			phNo = request.getParameter("telPhNo");
			mid = request.getParameter("txtmid");
			gstN = request.getParameter("txtGSTN");
			gstD = request.getParameter("txtGSTD");
			pass = request.getParameter("txtPass");
			rePass = request.getParameter("txtRePass");
			pto = request.getParameter("filePhoto");
			doConnect();
			
			try{								//code for check id is available or not
				stmt = conn.createStatement();
				rsRetID = stmt.executeQuery("select * from osp_tblretailer where Retailer_ID = '"+retID+"'");
				
				if(!rsRetID.next()){
					
					stmt.executeUpdate("insert into osp_tblretailer value('"+retID+"','"+retName+"','"+conPer+"','"+local+"','"+ct+"','"+st+"','"+phNo+"','"+mid+"','"+gstN+"','"+gstD+"','"+pass+"','"+rePass+"','"+pto+"')");
					
					//Code for show alert
						
					out.println("<script type='text/javaScript'>");
					out.println("alert("+"'Your data Saved Successfully...'"+");\n");
					out.println("setTimeout(function(){window.location.href='OSP_Retailerc.html'},10);");
					out.println("</script>\n");
				}
				else{
					//Code for show alert
				
					out.println("<script type='text/javaScript'>");
					out.println("alert("+"'Retailer ID already exists'"+");\n");
					out.println("setTimeout(function(){window.location.href='OSP_Retailerc.html'},10);");
					out.println("</script>\n");
				}
			}
			catch(SQLException sqle){
				out.println("Unable to save data "+sqle);
			}
		%>
	</body>
</html>