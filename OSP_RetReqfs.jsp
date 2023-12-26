<%@ page language="java" contentType="text/html" import="java.sql.*" %>
<%!
	String reqNo, dt, RetID, retN, pass, local, ct, phNo, mid, gstN, slN, proC, proN, cat, pri, qun, amo, btnUp, btnDel;
	String reqSl[], req, sl;
	Connection conn;
	Statement stmtUp, stmtDel;
	
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
	reqNo = request.getParameter("cmbReqNo");
	reqSl = reqNo.split("-");
	req = reqSl[0];
	sl = reqSl[1];
	dt = request.getParameter("dtDate");
	RetID = request.getParameter("txtRetID");
	pass = request.getParameter("txtPass");
	retN = request.getParameter("txtName");
	local = request.getParameter("txtLocal");
	ct = request.getParameter("txtCt");
	phNo = request.getParameter("txtphNo");
	mid = request.getParameter("txtMid");
	gstN = request.getParameter("txtgstNo");
	slN = request.getParameter("txtslNo");
	proC = request.getParameter("cmbproCode");
	proN = request.getParameter("txtprN");
	cat = request.getParameter("txtcat");
	pri = request.getParameter("txtPri");
	qun = request.getParameter("txtQun");
	amo = request.getParameter("txtAmo");
	btnUp = request.getParameter("btnUpd");
	btnDel = request.getParameter("btnDel");
	doConnect();
	
	try{		
		if(btnUp != null){
			stmtUp = conn.createStatement();
			stmtUp.executeUpdate("update osp_tblretreq set Date = '"+dt+"', Retailer_ID='"+RetID+"', Password='"+pass+"', Retailer_Name='"+retN+"', Locality='"+local+"', City='"+ct+"', Phone_Number='"+phNo+"', E_Mail='"+mid+"', GST_Number='"+gstN+"', Product_Code='"+proC+"', Product_Name='"+proN+"', Category='"+cat+"', Price='"+pri+"', Quentity='"+qun+"', Amount='"+amo+"' where Requisition_Number ='"+req+"' and Sl_No='"+sl+"'");
			
			//Code for show alert after data updated form database
				
			out.println("<script type='text/javaScript'>");
			out.println("alert("+"'Your Data Update Successfully...'"+");\n");
			out.println("setTimeout(function(){window.location.href='OSP_RetReqfc.jsp'},10);");
			out.println("</script>\n");
		}
		else if(btnDel != null){
			stmtDel = conn.createStatement();
			stmtDel.executeUpdate("delete from osp_tblretreq where Requisition_Number ='"+req+"'and Sl_No='"+sl+"'");
			
			//Code for show alert after data delete form database
				
			out.println("<script type='text/javaScript'>");
			out.println("alert("+"'Your Data Deleted Successfully...'"+");\n");
			out.println("setTimeout(function(){window.location.href='OSP_RetReqfc.jsp'},10);");
			out.println("</script>\n");
		}
	}
	catch(SQLException se){
		out.println("Unable to modify "+se);
	}
%>