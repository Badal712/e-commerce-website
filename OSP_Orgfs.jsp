<%@ page language="java" contentType="text/html" import="java.sql.*"%>
<%!
	Connection conn;
	Statement stmtUp, stmtDel;
	String regdno, date, orgname, headorg, local, ct, st, phno, mid, gstn, gstd, btnup, btndel;
	
	public void doConnect() {
		
		try{
			Class.forName("com.mysql.jdbc.Driver");
		}
		catch(ClassNotFoundException cnfe) {
			System.out.println("Unable to load Driver "+cnfe);
		}
		
		try{
			conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/ospdb","root","root");
		}
		catch(SQLException se){
			System.out.println("Unable to connect"+se);
		}
		
	}
%>
<html>
	<head>
		<title>Save</title>
	</head>
	
	<body>
		<%
			regdno = request.getParameter("cmbRegdNo");
			date = request.getParameter("txtDate");
			orgname = request.getParameter("txtOrgName");
			headorg = request.getParameter("txtHOrg");
			local = request.getParameter("txtLoc");
			ct = request.getParameter("txtCity");
			st = request.getParameter("txtState");
			phno = request.getParameter("txtTelNo");
			mid = request.getParameter("txtmid");
			gstn = request.getParameter("txtGSTNo");
			gstd = request.getParameter("txtGSTDt");
			btnup = request.getParameter("btnUpd");
			btndel = request.getParameter("btnDel");
			doConnect();
			
			try{
				if(btnup != null){
					stmtUp = conn.createStatement();
					stmtUp.executeUpdate("update tblorgn set DATE = '"+date+"', Organization_Name = '"+orgname+"',Head_of_Organization = '"+headorg+"', Locality = '"+local+"', City = '"+ct+"', State = '"+st+"', Phone_Number = '"+phno+"', e_Mail = '"+mid+"', GST_Number = '"+gstn+"', GST_Date = '"+gstd+"' where Registration_Number = '"+regdno+"'");
					
					//Code for show alert after data updated form database
				
					out.println("<script type='text/javaScript'>");
					out.println("alert("+"'Your Data Update Successfully...'"+");\n");
					out.println("setTimeout(function(){window.location.href='OSP_Orgfc.jsp'},10);");
					out.println("</script>\n");
				}
				else if (btndel != null) {
					stmtDel = conn.createStatement();
					stmtDel.executeUpdate("delete from tblorgn where Registration_Number = '"+regdno+"'");
					
					//Code for show alert after data deleted form database
				
					out.println("<script type='text/javaScript'>");
					out.println("alert("+"'Your Data Deleted Successfully...'"+");\n");
					out.println("setTimeout(function(){window.location.href='OSP_Orgfc.jsp'},10);");
					out.println("</script>\n");
				}
			}
			catch(SQLException se){
				out.println("Unable to process "+se);
			}
		%>
	</body>
</html>