<%@ page language="java" contentType="text/html" import="java.sql.*" %>
<%!
	Connection conn;
	Statement stmtUp, stmtDel;
	String reqNo, dt, suppID, suppN, local, phNo, ct, gstN, mid, slno, proC, proN, cat, pri, qun, amo, btnUp, btnDel;
	String reqsl[];
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
<html>
	<head>
		<title>Server Page</title>
	</head>
	<head>
		<%
			reqNo = request.getParameter("cmbReqNum");
			reqsl=reqNo.split("-");                  //Split Requisition Number & Sl No.
			System.out.println("Req "+reqsl[0]);
			System.out.println("SL "+reqsl[1]);
			dt = request.getParameter("dtDate");
			suppID = request.getParameter("cmbSupID");
			suppN = request.getParameter("txtsupName");
			local = request.getParameter("txtlocal");
			phNo = request.getParameter("txtPhNo");
			ct = request.getParameter("txtCT");
			gstN = request.getParameter("txtGSTN");
			mid = request.getParameter("txtmid");
			slno = request.getParameter("txtslNo");
			proC = request.getParameter("cmbProC");
			proN = request.getParameter("txtProname");
			cat = request.getParameter("txtCat");
			pri = request.getParameter("txtPri");
			qun = request.getParameter("txtQun");
			amo = request.getParameter("txtAmo");
			btnUp = request.getParameter("btnUpd");
			btnDel = request.getParameter("btnDel");
			doConnect();
			
			try{
				if(btnUp != null){
					stmtUp = conn.createStatement();
					stmtUp.executeUpdate("update osp_tblsuppreg set Supplier_Name='"+suppN+"',Date='"+dt+"',Locality='"+local+"',Supplier_ID='"+suppID+"',Phone_Number='"+phNo+"',City='"+ct+"',GST_Number='"+gstN+"',e_Mail='"+mid+"',SlNo='"+slno+"',Product_Code='"+proC+"',Product_Name='"+proN+"',Category='"+cat+"', Price='"+pri+"', Quantity='"+qun+"',Amount='"+amo+"' where Requisition_Number='"+reqsl[0]+"'");
					
						//Code for show alert after data updated form database
					
						out.println("<script type='text/javaScript'>");
						out.println("alert("+"'Your Data Update Successfully...'"+");\n");
						out.println("setTimeout(function(){window.location.href='OSP_SuppRegfc.jsp'},10);");
						out.println("</script>\n");
				}
				else if(btnDel != null){
					stmtDel = conn.createStatement();
					stmtDel.executeUpdate("delete from osp_tblsuppreg where Requisition_Number='"+reqsl[0]+"'");
					
					//Code for show alert after data deleted form database
				
					out.println("<script type='text/javaScript'>");
					out.println("alert("+"'Your Data Deleted Successfully...'"+");\n");
					out.println("setTimeout(function(){window.location.href='OSP_SuppRegfc.jsp'},10);");
					out.println("</script>\n");
				}
			}
			catch(SQLException se){
				out.println("Unable to process "+se);
			}
		%>
	</head>
</html>