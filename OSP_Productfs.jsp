<%@ page language="java" contentType="text/html" import="java.sql.*" %>
<html>
	<head>
		<title>Product Update</title>
	</head>
	<body>
		<%!
			Connection conn;
			Statement stmtUp, stmtDel;
			String supC, supName, proCat, proCC, proC, proName, unit, purPrice, mrp, taxSl, stock, img, btnUp, btnDel;
			
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
		
		<%
			supC = request.getParameter("cmbSupCode");
			supName = request.getParameter("txtSupName");
			proCat = request.getParameter("cmbProCat");
			proCC = request.getParameter("txtProCC");
			proC = request.getParameter("cmbProC");
			proName = request.getParameter("txtProName");
			unit = request.getParameter("txtUnit");
			purPrice = request.getParameter("txtPurPrice");
			mrp = request.getParameter("txtMRP");
			taxSl = request.getParameter("cmbTaxSl");
			stock = request.getParameter("txtstock");
			btnUp = request.getParameter("btnUpload");
			btnDel = request.getParameter("btnDelete");
			img = request.getParameter("fileImage");
			if(img.length() == 0){
				img = request.getParameter("hdnPhoto");
			}
			doConnect();
			
			
			try{
				if(btnUp != null){
					stmtUp = conn.createStatement();
					stmtUp.executeUpdate("update osp_tblproduct set Supplier_Name='"+supName+"', Supplier_Code='"+supC+"',Product_Category='"+proCat+"',Product_Category_Code='"+proCC+"',Product_Name='"+proName+"',Unit='"+unit+"',Purchase_Price='"+purPrice+"',MRP='"+mrp+"',Tax_Slab='"+taxSl+"',Stock='"+stock+"',Image='"+img+"' where Product_Code='"+proC+"'");
					
					//Code for show alert for update
				
					out.println("<script type='text/javaScript'>");
					out.println("alert("+"'Your record update Successfully...'"+");\n");
					out.println("setTimeout(function(){window.location.href='OSP_Productfc.jsp'},10);");
					out.println("</script>\n");
				}
				else if(btnDel != null){
					stmtDel = conn.createStatement();
					stmtDel.executeUpdate("delete from osp_tblproduct where Product_Code='"+proC+"'");
					
					//Code for show alert for delete
				
					out.println("<script type='text/javaScript'>");
					out.println("alert("+"'One record deleted scucessfully...'"+");\n");
					out.println("setTimeout(function(){window.location.href='OSP_Productfc.jsp'},10);");
					out.println("</script>\n");
				}
			}
			catch(SQLException sqle){
				out.println("Unable to modify data "+sqle);
			}
		%>
	</body>
</html>