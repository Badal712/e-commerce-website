<%@ page language="java" contentType="text/html" import="java.sql.*" %>
<%!
	Connection conn;
	Statement stmtUp, stmtDel;
	String vouN, vouD, supID, supName, phNo, mid, gstN, payM, refN, dt, bank, amo, btnUp, btnDel;
	
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
		<title>Update Page</title>
		
	</head>
	<body>
		<%
			vouN = request.getParameter("cmbVouN");
			vouD = request.getParameter("txtVouDt");
			supID = request.getParameter("cmbSupID");
			supName = request.getParameter("txtSupName");
			phNo = request.getParameter("telPhone");
			mid = request.getParameter("txtMail");
			gstN = request.getParameter("txtGSTN");
			payM = request.getParameter("cmbPaymode");
			refN = request.getParameter("txtRefNo");
			dt = request.getParameter("txtRefDt");
			bank = request.getParameter("cmbBank");
			amo = request.getParameter("txtAmo");
			btnUp = request.getParameter("btnUpd");
			btnDel = request.getParameter("btnDel");
			doConnect();
			
			try{
				if(btnUp != null){
					stmtUp = conn.createStatement();
					stmtUp.executeUpdate("update osp_tblpayment set Voucher_Date = '"+vouD+"', Supplier_ID = '"+supID+"', Supplier_Name = '"+supName+"', Phone_Number = '"+phNo+"', E_Mail = '"+mid+"', GST_Number = '"+gstN+"', Payment_Mode = '"+payM+"', Refernce_Number = '"+refN+"', Date = '"+dt+"', Bank_Name = '"+bank+"', Amount = '"+amo+"' where Voucher_Number = '"+vouN+"'");
					
					//Code for show alert after data updated form database
				
					out.println("<script type='text/javaScript'>");
					out.println("alert("+"'Your Data Update Successfully...'"+");\n");
					out.println("setTimeout(function(){window.location.href='OSP_PaymentVoufc.jsp'},10);");
					out.println("</script>\n");
				}
				else if(btnDel != null){
					stmtDel = conn.createStatement();
					stmtDel.executeUpdate("delete from osp_tblpayment where Voucher_Number = '"+vouN+"'");
					
					//Code for show alert after data updated form database
				
					out.println("<script type='text/javaScript'>");
					out.println("alert("+"'Your Data Deleted Successfully...'"+");\n");
					out.println("setTimeout(function(){window.location.href='OSP_PaymentVoufc.jsp'},10);");
					out.println("</script>\n");
				}
			}
			catch(SQLException sqle){
				out.println("Unable to process "+sqle);
			}	
		%>
	</body>
</html>