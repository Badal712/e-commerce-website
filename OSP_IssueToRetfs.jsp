<%@ page language="java" contentType="text" import="java.sql.*" %>
<%!
	Connection conn;
	Statement stmtUp, stmtDel,stmtStock;
	String invNo, invDt, reqNo, reqDt, retN, retID, loc, ct, phNo, mid, gstN, invT, slNo, proID, proN, cat, price, issQ, amo, disP, disA, gstP, gstA, netA, btnUp, btnDel;
	String invsl[],inv,sl;
	float oldiQ,newiQ;
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
	<body>
		<%
			invNo = request.getParameter("cmbInvN");
			invsl=invNo.split("-");
			inv=invsl[0];
			sl=invsl[1];
			invDt = request.getParameter("txtInvDt");
			reqNo = request.getParameter("cmbReqN");
			reqDt = request.getParameter("txtReqDt");
			retN = request.getParameter("txtretN");
			retID = request.getParameter("txtretID");
			loc = request.getParameter("txtlocal");
			ct = request.getParameter("txtCt");
			phNo = request.getParameter("txtphno");
			mid = request.getParameter("txtMid");
			gstN = request.getParameter("txtGSTN");
			invT = request.getParameter("cmbInvType");
			//slNo = request.getParameter("numSlNo");
			proID = request.getParameter("cmbProID");
			proN = request.getParameter("txtProN");
			cat = request.getParameter("txtCat");
			price = request.getParameter("txtPri");
			issQ = request.getParameter("txtIssQ");
			newiQ=Float.parseFloat(issQ);
			oldiQ = Float.parseFloat(request.getParameter("hdnIssQ"));
			amo = request.getParameter("txtAmo");
			disP = request.getParameter("txtDis");
			disA = request.getParameter("txtDisA");
			gstP = request.getParameter("txtGST");
			gstA = request.getParameter("txtGSTA");
			netA = request.getParameter("txtNetA");
			btnUp = request.getParameter("btnUpd");
			btnDel = request.getParameter("btnDel");
			doConnect();
			
			try{
				
				if(btnUp != null){
					stmtUp = conn.createStatement();
					stmtUp.executeUpdate("update osp_tblissuetoret set Invoice_Date='"+invDt+"', Requisition_Number = '"+reqNo+"', Requisition_Date='"+reqDt+"', Retailer_Name='"+retN+"', Retailer_ID='"+retID+"', Locality='"+loc+"', City='"+ct+"', Phone_Number='"+phNo+"', e_Mail='"+mid+"', GST_Number='"+gstN+"', Invoice_Type='"+invT+"', Product_ID='"+proID+"', Product_Name='"+proN+"', Category='"+cat+"', Price='"+price+"', Issue_Quantity='"+issQ+"', Amount='"+amo+"', Discount_P='"+disP+"', Discount_Amount='"+disA+"', GST_P='"+gstP+"', GST_Amount='"+gstA+"', Net_Amount='"+netA+"' where Invoice_Number='"+inv+"' and Sl_No='"+sl+"'");
					
					
					//Update stock data in the product table in the database.
				
				stmtStock = conn.createStatement();
				stmtStock.executeUpdate("update osp_tblproduct set Stock = Stock + '"+oldiQ+"' - '"+newiQ+"' where Product_Code = '"+proID+"'");
					
					//Code for show alert after data updated form database
				
					out.println("<script type='text/javaScript'>");
					out.println("alert("+"'Your Data Update Successfully...'"+");\n");
					out.println("setTimeout(function(){window.location.href='OSP_IssueToRetfc.jsp'},10);");
					out.println("</script>\n");
				}
				else if(btnDel != null){
					stmtDel = conn.createStatement();
					stmtDel.executeUpdate("delete from osp_tblissuetoret where Invoice_Number='"+inv+"'");
					
					//Delete stock data in the product table in the database.
				
					stmtStock = conn.createStatement();
					stmtStock.executeUpdate("update osp_tblproduct set Stock = Stock + '"+oldiQ+"' where Product_Code = '"+proID+"'");
					
					//Code for show alert after data delete form database
				
					out.println("<script type='text/javaScript'>");
					out.println("alert("+"'Your Data Deleted Successfully...'"+");\n");
					out.println("setTimeout(function(){window.location.href='OSP_IssueToRetfc.jsp'},10);");
					out.println("</script>\n");
				}
			}
			catch(SQLException se){
				out.println("Unable to Proceed..."+se);
			}
		%>
	</body>
</html>