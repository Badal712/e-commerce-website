<%@ page language="java" contentType="text/html" import="java.sql.*"%>
<%!
	Connection conn;
	Statement stmt, stmtStock;
	String invN, invD, ordN, ordD, custNo, custN, loc, ct, cNo, mid, gstN, invT, slNo, proID, proN, cat, pri, issQ, amo, disP, disA, gstP, gstA, nAmo;
	
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
			invN = request.getParameter("txtInvN");
			invD = request.getParameter("txtInvDt");
			ordN = request.getParameter("cmbOrdN");
			ordD = request.getParameter("txtOrdDt");
			custNo = request.getParameter("txtcustNo");
			custN = request.getParameter("txtcustN");
			loc = request.getParameter("txtlocal");
			ct = request.getParameter("txtCt");
			cNo = request.getParameter("txtcNo");
			mid = request.getParameter("txtMid");
			gstN = request.getParameter("txtGSTN");
			invT = request.getParameter("cmbInvType");
			slNo = request.getParameter("numSlNo");
			proID = request.getParameter("cmbProID");
			proN = request.getParameter("txtProN");
			cat = request.getParameter("txtCat");
			pri = request.getParameter("txtPri");
			issQ = request.getParameter("txtIssQ");
			amo = request.getParameter("txtAmo");
			disP = request.getParameter("txtDis");
			disA = request.getParameter("txtDisA");
			gstP = request.getParameter("txtGST");
			gstA = request.getParameter("txtGSTA");
			nAmo = request.getParameter("txtNetA");
			doConnect();
			
			try{
				stmt = conn.createStatement();
				stmt.executeUpdate("insert into osp_tblissuetocust value('"+invN+"', '"+invD+"', '"+ordN+"', '"+ordD+"', '"+custNo+"', '"+custNo+"', '"+loc+"', '"+ct+"', '"+cNo+"', '"+mid+"', '"+gstN+"', '"+invT+"','"+slNo+"', '"+proID+"', '"+proN+"', '"+cat+"', '"+pri+"', '"+issQ+"', '"+amo+"', '"+disP+"', '"+disA+"', '"+gstP+"', '"+gstA+"', '"+nAmo+"')");
				
				//Update stock data in the product table in the database.
				
				stmtStock = conn.createStatement();
				stmtStock.executeUpdate("update osp_tblproduct set Stock = Stock - '"+issQ+"' where Product_Code = '"+proID+"'");
				
				//Code for show alert
					
				out.println("<script type='text/javaScript'>");
				out.println("alert("+"'Your data Saved Successfully...'"+");\n");
				out.println("setTimeout(function(){window.location.href='OSP_IssueToCustc.jsp'},10);");
				out.println("</script>\n");
			}
			catch(SQLException se){
				out.println("Unable to sava data "+se);
			}
		%>
	</head>
</html>