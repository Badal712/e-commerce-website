<%@ page language="java" contentType="text/html" import="java.sql.*" %>
<%!
	Connection conn;
	Statement stmt;
	String reqN, dt, retID, pass, retNa, local, ct, phNo, mid, gstN, slNo, proC, proN, cat, pri, qun, amo;
	
	public void doConnect(){
		
		try{
			Class.forName("com.mysql.jdbc.Driver");
		}
		catch(ClassNotFoundException cnfe){
			System.out.println("Unable to laod driver "+cnfe);
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
	<head>
	<body>
		<%
			reqN = request.getParameter("txtReqNo");
			dt = request.getParameter("dtDate");
			retID = request.getParameter("txtRetID");
			pass = request.getParameter("txtPass");
			retNa = request.getParameter("txtName");
			local = request.getParameter("txtLocal");
			ct = request.getParameter("txtCt");
			phNo = request.getParameter("txtphNo");
			mid = request.getParameter("txtMid");
			gstN = request.getParameter("txtgstNo");
			slNo = request.getParameter("txtslNo");
			proC = request.getParameter("cmbproCode");
			proN = request.getParameter("txtprN");
			cat = request.getParameter("txtcat");
			pri = request.getParameter("txtPri");
			qun = request.getParameter("txtQun");
			amo = request.getParameter("txtAmo");
			doConnect();
			
			try{
				stmt = conn.createStatement();
				stmt.executeUpdate("insert into osp_tblretreq value('"+reqN+"', '"+dt+"', '"+retID+"', '"+pass+"', '"+retNa+"', '"+local+"', '"+ct+"', '"+phNo+"', '"+mid+"', '"+gstN+"', '"+slNo+"', '"+proC+"', '"+proN+"', '"+cat+"', '"+pri+"','"+qun+"', '"+amo+"')");
				
				//Code for show alert
					
				out.println("<script type='text/javaScript'>");
				out.println("alert("+"'Your data Saved Successfully...'"+");\n");
				out.println("setTimeout(function(){window.location.href='OSP_RetReqc.jsp'},10);");
				out.println("</script>\n");
			}
			catch(SQLException se){
				out.println("Unable to save "+se);
			}
		%>
	</body>
</html>