<%@ page language="java" contentType="text/html" import="java.sql.*"%>
<%!
	Connection conn;
	Statement stmt, stmtStock;
	String vouN, vouD, supID, supN, phNo, mid, gstN, payM, refN, dt, bank, amo;
	
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
<html>
	<head>
		<title>Server Page</title>
	</head>
	<head>
		<%
			vouN = request.getParameter("txtVouN");
			vouD = request.getParameter("txtVouDt");
			supID = request.getParameter("cmbSupID");
			supN = request.getParameter("txtSupName");
			phNo = request.getParameter("telPhone");
			mid = request.getParameter("txtMail");
			gstN = request.getParameter("txtGSTN");
			payM = request.getParameter("cmbPaymode");
			refN = request.getParameter("txtRefNo");
			dt = request.getParameter("txtRefDt");
			bank = request.getParameter("cmbBank");
			amo = request.getParameter("txtAmo");
			doConnect();
			
			try{
				stmt = conn.createStatement();
				stmt.executeUpdate("insert into osp_tblpayment value('"+vouN+"', '"+vouD+"', '"+supID+"', '"+supN+"', '"+phNo+"', '"+mid+"', '"+gstN+"', '"+payM+"', '"+refN+"', '"+dt+"', '"+bank+"', '"+amo+"')");
				
				//Code for show alert
					
				out.println("<script type='text/javaScript'>");
				out.println("alert("+"'Your data Saved Successfully...'"+");\n");
				out.println("setTimeout(function(){window.location.href='OSP_PaymentVouc.jsp'},10);");
				out.println("</script>\n");
			}
			catch(SQLException se){
				out.println("Unable to sava data "+se);
			}
		%>
	</head>
</html>