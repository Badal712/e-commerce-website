<%@ page language="java" contentType="text/html" import="java.sql.*" %>
<%!
	Connection conn;
	Statement stmtArray, stmtordN, stmtPro, stmtInv;
	ResultSet rsArray, rsordN, rsPro, rsInv;
	String invNo, slNo, invsl, invDt[], ordNo[], ordDt[], custN[], custNo[], local[], ct[], cNo[], mid[], gstN[], invT[], slN[], prodID[], prodN[], cate[], price[], issQ[], amo[], disP[], disA[], gstP[], gstA[], netA[];
	String orNo, orDt[], cusN[], cusNo[], loca[], cit[], cNum[], emid[];
	String proID, proN[], cat[], pri[], gst[];
	int i, j;
	
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
	invDt = new String[20];
	ordNo = new String[20];
	ordDt = new String[20];
	custN = new String[20];
	custNo = new String[20];
	local = new String[20];
	ct = new String[20];
	cNo = new String[20];
	mid = new String[20];
	gstN = new String[20];
	invT = new String[20];
	slN = new String[20];
	prodID = new String[20];
	prodN = new String[20];
	cate = new String[20];
	price = new String[20];
	issQ = new String[20];
	amo = new String[20];
	disP = new String[20];
	disA = new String[20];
	gstP = new String[20];
	gstA = new String[20];
	netA = new String[20];
	doConnect();
	
	try{
		stmtArray = conn.createStatement();
		rsArray = stmtArray.executeQuery("select * from osp_tblissuetocust");
		i = 0;
		
		while(rsArray.next()){
			invDt[i] = rsArray.getString("Invoice_Date");
			ordNo[i] = rsArray.getString("Order_Number");
			ordDt[i] = rsArray.getString("Order_Date");
			custN[i] = rsArray.getString("Customer_Name"); 
			custNo[i] = rsArray.getString("Customer_Number");
			local[i] = rsArray.getString("Locality");
			ct[i] = rsArray.getString("City");
			cNo[i] = rsArray.getString("Contact_Number");
			mid[i] = rsArray.getString("E_Mail");
			gstN[i] = rsArray.getString("GST_Number");
			invT[i] = rsArray.getString("Invoice_Type");
			slN[i] = rsArray.getString("Sl_No");
			prodID[i] = rsArray.getString("Product_ID");
			prodN[i] = rsArray.getString("Product_Name");
			cate[i] = rsArray.getString("Category");
			price[i] = rsArray.getString("Price");
			issQ[i] = rsArray.getString("Issue_Quantity");
			amo[i] = rsArray.getString("Amount");
			disP[i] = rsArray.getString("Discount_P");
			disA[i] = rsArray.getString("Discount_Amount");
			gstP[i] = rsArray.getString("GST_P");
			gstA[i] = rsArray.getString("GST_Amount");
			netA[i] = rsArray.getString("Net_Amount");
			i++;
		}
	}
	catch(SQLException se){
		out.println("Unable to collect "+se);
	}
%>
<%
	
	orDt = new String[20];
	cusN = new String[20];
	cusNo = new String[20];
	loca = new String[20];
	cit = new String[20];
	cNum = new String[20];
	emid = new String[20];
	doConnect();
	
	try{
		stmtArray = conn.createStatement();
		rsArray = stmtArray.executeQuery("select * from osp_tblcustorder");
		i = 0;
		
		while(rsArray.next()){
			
			orDt[i] = rsArray.getString("Order_Date");
			cusN[i] = rsArray.getString("Name"); 
			cusNo[i] = rsArray.getString("Mobile_Number");
			loca[i] = rsArray.getString("Locality");
			cit[i] = rsArray.getString("City");
			cNum[i] = rsArray.getString("Contant_Number");
			emid[i] = rsArray.getString("E_Mail");
			i++;
		}
	}
	catch(SQLException sqle){
		out.println("Unable to collect data "+sqle);
	}
%>
<%
	proN = new String[20];
	cat = new String[20];
	pri = new String[20];
	gst = new String[20];
	doConnect();
	
	try{
		stmtArray = conn.createStatement();
		rsArray = stmtArray.executeQuery("select * from osp_tblproduct");
		i = 0;
		
		while(rsArray.next()){
			proN[i] = rsArray.getString("Product_Name");
			cat[i] = rsArray.getString("Product_Category");
			pri[i] = rsArray.getString("MRP");
			gst[i] = rsArray.getString("Tax_Slab");
			i++;
		}
	}
	catch(SQLException sqle){
		out.println("Unable to collect data "+sqle);
	}
%>
<html>
	<head>
		<title>Receipt of Goods</title>
		<link rel="stylesheet" href="style2.css">
		<script language="javascript">
			function showCustomerInv(){
				var jinvDt, jordNo, jordDt, jcustN, jcustNo, jlocal, jct, jcNo, jmid, jgstN, jinvT, jslN, jprodID, jprodN, jcate, jprice, jissQ, jamo, jdisP, jdisA, jgstP, jgstA, jnetA;
				var i, j;
				
				jinvDt = new Array();
				jordNo = new Array();
				jordDt = new Array();
				jcustN = new Array();
				jcustNo = new Array;
				jlocal = new Array();
				jct = new Array();
				jcNo = new Array();
				jmid = new Array();
				jgstN = new Array();
				jinvT = new Array();
				jslN = new Array();
				jprodID = new Array();
				jprodN = new Array();
				jcate = new Array();
				jprice = new Array();
				jissQ = new Array();
				jamo = new Array();
				jdisP = new Array();
				jdisA = new Array();
				jgstP = new Array();
				jgstA = new Array();
				jnetA = new Array();
				j = 0;
				<%
					i = 0;
					while(i < local.length){
				%>
						jinvDt[j] ="<%=invDt[i]%>";
						jordNo[j] ="<%=ordNo[i]%>";
						jordDt[j] = "<%=ordDt[i]%>"; 
						jcustN[j] = "<%=custN[i]%>";
						jcustNo[j] = "<%=custNo[i]%>";
						jlocal[j] = "<%=local[i]%>";
						jct[j] = "<%=ct[i]%>";
						jcNo[j] = "<%=cNo[i]%>";
						jmid[j] = "<%=mid[i]%>";
						jgstN[j] ="<%=gstN[i]%>";
						jinvT[j] ="<%=invT[i]%>";
						jslN[j] ="<%=slN[i]%>";
						jprodID[j] ="<%=prodID[i]%>";
						jprodN[j] ="<%=prodN[i]%>";
						jcate[j] ="<%=cate[i]%>";
						jprice[j] ="<%=price[i]%>";
						jissQ[j] ="<%=issQ[i]%>";
						jamo[j] ="<%=amo[i]%>";
						jdisP[j] ="<%=disP[i]%>";
						jdisA[j] ="<%=disA[i]%>";
						jgstP[j] ="<%=gstP[i]%>";
						jgstA[j] ="<%=gstA[i]%>";
						jnetA[j] ="<%=netA[i]%>";
						j++;
				<%
						i++;
					}
				%>
				k = document.f1.cmbinvNum.selectedIndex;
				document.f1.txtInvDt.value = jinvDt[k-1];
				document.f1.cmbOrdN.value = jordNo[k-1];
				document.f1.txtOrdDt.value = jordDt[k-1];
				document.f1.txtcustN.value = jcustN[k-1];
				document.f1.txtcustNo.value = jcustNo[k-1];
				document.f1.txtlocal.value = jlocal[k-1];
				document.f1.txtCt.value = jct[k-1];
				document.f1.txtcNo.value = jcNo[k-1];
				document.f1.txtMid.value = jmid[k-1];
				document.f1.txtGSTN.value = jgstN[k-1];
				document.f1.cmbInvType.value = jinvT[k-1];
				document.f1.numSlNo.value = jslN[k-1];
				document.f1.cmbProID.value = jprodID[k-1];
				document.f1.txtProN.value = jprodN[k-1];
				document.f1.txtCat.value = jcate[k-1];
				document.f1.txtPri.value = jprice[k-1];
				document.f1.txtIssQ.value = jissQ[k-1];
				document.f1.hdnIssQ.value = jissQ[k-1];
				document.f1.txtAmo.value = jamo[k-1];
				document.f1.txtDis.value = jdisP[k-1];
				document.f1.txtDisA.value = jdisA[k-1];
				document.f1.txtGST.value = jgstP[k-1];
				document.f1.txtGSTA.value = jgstA[k-1];
				document.f1.txtNetA.value = jnetA[k-1];
			}
			function showCustomer(){
				var jorDt, jcusN, jcusNo, jloca, jcit, jcNum, jemid;
				var i, j;
				
				jorDt = new Array();
				jcusN = new Array();
				jcusNo = new Array;
				jloca = new Array();
				jcit = new Array();
				jcNum = new Array();
				jemid = new Array();
				j = 0;
				<%
					i = 0;
					while(i < local.length){
				%>
						
						jorDt[j] = "<%=orDt[i]%>"; 
						jcusN[j] = "<%=cusN[i]%>";
						jcusNo[j] = "<%=cusNo[i]%>";
						jloca[j] = "<%=loca[i]%>";
						jcit[j] = "<%=cit[i]%>";
						jcNum[j] = "<%=cNum[i]%>";
						jemid[j] = "<%=emid[i]%>";
						j++;
				<%
						i++;
					}
				%>
				k = document.f1.cmbOrdN.selectedIndex;
				document.f1.txtOrdDt.value = jorDt[k-1];
				document.f1.txtcustN.value = jcusN[k-1];
				document.f1.txtcustNo.value = jcusNo[k-1];
				document.f1.txtlocal.value = jloca[k-1];
				document.f1.txtCt.value = jcit[k-1];
				document.f1.txtcNo.value = jcNum[k-1];
				document.f1.txtMid.value = jemid[k-1];
			}
			function showProd(){
				var jproN, jcat, jpri, jgst, jphNo, jmid, jgstN; 
				var i, j;
				
				jproN = new Array();
				jcat = new Array();
				jpri = new Array();
				jgst = new Array();
				j = 0;
				
				<%
					i = 0;
					while(i < proN.length){
				%>
						jproN[j] = "<%=proN[i]%>";
						jcat[j] = "<%=cat[i]%>";
						jpri[j] = "<%=pri[i]%>";
						jgst[j] = "<%=gst[i]%>";
						j++;
				<%
						i++;
					}
				%>
				
				k = document.f1.cmbProID.selectedIndex;
				document.f1.txtProN.value = jproN[k-1];
				document.f1.txtCat.value = jcat[k-1];
				document.f1.txtPri.value = jpri[k-1];
				document.f1.txtGST.value = jgst[k-1];
				
			}
			function showAmount(){
				
				var qun, price, total;
				price = parseInt(document.f1.txtPri.value);
				qun = parseInt(document.f1.txtIssQ.value);
				total = qun*price;
				document.f1.txtAmo.value=total;
			}
		</script>
		<script language="javascript">
		
			
			function showData(){
				var amt, disP, disA;
				amt = parseInt(document.f1.txtAmo.value);
				dis = parseInt(document.f1.txtDis.value);
				disA = dis/100*amt;
				document.f1.txtDisA.value=disA;
			}
			function showGst(){
				
				var amt, gstP, gstA;
				amt = parseInt(document.f1.txtAmo.value);
				gstP = parseInt(document.f1.txtGST.value);
				disA = parseInt(document.f1.txtDisA.value);
				
				nAmo = amt-disA;
				gstA = gstP/100*nAmo;
				document.f1.txtGSTA.value=gstA;
				fAmo = nAmo+gstA;
				document.f1.txtNetA.value = fAmo;	
			}
			function goFind(){
				window.location = "OSP_IssueToCustc.jsp";
			}
		</script>
	</head>
	<body>
		<section class="Contener">
			<header>
				<div class="logo-container">
					<div class="logo">
						<img src="OSS Logo cart.png" class="logo logoimg" alt="One Stop Shop Logo cart image">
					</div>
					<div class="logo">
						<img src="OSS Logo name.png" class="logo logoname" alt="One Stop Shop name">
					</div>
				</div>
				<div class="Heading">
					<h1>Online Shopping Portal</h1>
				</div>
				<nav class="nav-tabs">
					<ul>
						<li><a href="#">Home</a></li>
						<li><a href="#">Login</a></li>
						<li><a href="#">Signup</a></li>
					</ul>
				</nav>
			</header>
			<form name="f1" action="OSP_IssueToCustfs.jsp" method="post">
				<h2>Issue to Customer</h2>
				<div class="Main">
					<div class="box">
						<div class="row">
							<div class="input_box">
								<label class="lbl">Invoice Number :<font color="red">*</font></label>
								<select name="cmbinvNum" class="tbox" onchange="showCustomerInv()">
									<option value="">--select--</option>
									<%
									doConnect();
									try{
										stmtInv = conn.createStatement();
										rsInv = stmtInv.executeQuery("select * from osp_tblissuetocust");
										while(rsInv.next()){
											invNo = rsInv.getString("Invoice_Number");
											slNo = rsInv.getString("Sl_No");
											invsl =invNo+"-"+slNo;
									%>
									<option value="<%=invsl%>"><%=invsl%></option>
									<%
										}
									}
									catch(SQLException se){
										System.out.println("Unable to show data");
									}
									%>
								</select>
							</div>
							<div class="input_box">
								<label class="lbl">Invoice Date :<font color="red">*</font></label>
								<input type="date" name="txtInvDt" class="tbox" required>
							</div>
						</div>
						<div class="row">
							<div class="input_box">
								<label class="lbl">Order Number:</label>
								<select class="tbox" name="cmbOrdN" onchange="showCustomer()">
									<option value="">--select--</option>
									<%
										doConnect();
										try{
											stmtordN = conn.createStatement();
											rsordN = stmtordN.executeQuery("select * from osp_tblcustorder");
											while(rsordN.next()){
												orNo = rsordN.getString("Order_Number");
									%>
									<option value="<%=orNo%>"><%=orNo%></option>
									<%
											}
										}
										catch(SQLException se){
											System.out.println("Unable to show "+se);
										}
									%>
								</select>
							</div>
							<div class="input_box">
								<label class="lbl">Order Date: </label>
								<input type="text" class="tbox" name="txtOrdDt" readonly> 
							</div>
						</div>
						<div class="row">
							<div class="input_box">
								<label class="lbl">Customer Number:</label>
								<input type="text" class="tbox" name="txtcustNo" readonly>
							</div>
							<div class="input_box">
								<label class="lbl">Customer Name:</label>
								<input type="text" class="tbox" name="txtcustN" readonly>
							</div>
						</div>
						<div class="row">
							<div class="input_box">
								<label class="lbl">Locality :</label>
								<input type="text" class="tbox" name="txtlocal" readonly>
							</div>
							<div class="input_box">
								<label class="lbl">City :</label>
								<input type="text" class="tbox" name="txtCt" readonly>
							</div>
						</div>
						<div class="row">
							<div class="input_box">
								<label class="lbl">Contact Number :</label>
								<input type="text" name="txtcNo" class="tbox" readonly>
							</div>
							<div class="input_box">
								<label class="lbl">E Mail</label>
								<input type="text" name="txtMid" class="tbox" readonly>
							</div>
						</div>
						<div class="row">
							<div class="input_box">
								<label class = "lbl">GST Number :</label>
								<input type="text" name="txtGSTN" class="tbox" readonly value="N/A">
							</div>
							<div class="input_box">
								<label class="lbl">Invoice Type :<font color="red">*</font></label>
								<select class="tbox" name="cmbInvType" required>
									<option value="">--select--</option>
									<option value="CREDIT">CREDIT</option>
									<option value="CASH">CASH</option>
								</select>
							</div>
						</div>
						<div class="row">
							<div class="input_box">
								<label class="olLbl">Sl No.:</label>
								<input type="Number" class="tbox" name="numSlNo">
							</div>
							<div class="input_box">
								<label class="olLbl">Product ID:</label>
								<select class="tbox" name="cmbProID" onchange="showProd()">
									<option value="">--select--</option>
									<%
										doConnect();
										try{
											stmtPro = conn.createStatement();
											rsPro = stmtPro.executeQuery("select * from osp_tblproduct");
											while(rsPro.next()){
												proID = rsPro.getString("Product_Code");
									%>
									<option value="<%=proID%>"><%=proID%></option>
									<%
											}
										}
										catch(SQLException se){
											out.println("Unable to show data "+se);
										}
									%>
								</select>
							</div>
							<div class="input_box">
								<label class="olLbl">Product Name:</label>
								<input type="text" class="tbox" name="txtProN" readonly>
							</div>
							<div class="input_box">
								<label class="olLbl">Category:</label>
								<input type="text" class="tbox" name="txtCat" readonly>
							</div>
							<div class="input_box">
								<label class="olLbl">Price</label>
								<input type="text" class="tbox" name="txtPri" readonly>
							</div>
							<div class="input_box">
								<label class="olLbl">Issue Quantity:</label>
								<input type="text" class="tbox" name="txtIssQ" onblur="showAmount()">
								<input type="hidden" name="hdnIssQ">
							</div>
							<div class="input_box">
								<label class="olLbl">Amount:</label>
								<input type="text" class="tbox" name="txtAmo">
							</div>
							<div class="input_box">
								<label class="olLbl">Discount %:</label>
								<input type="text" class="tbox" name="txtDis" onblur="showData()">
							</div>
							<div class="input_box">
								<label class="olLbl">Discount Amount:</label>
								<input type="text" class="tbox" name="txtDisA">
							</div>
							<div class="input_box">
								<label class="olLbl">GST %:</label>
								<input type="text" class="tbox" name="txtGST" readonly onblur="showGst()">
							</div>
							<div class="input_box">
								<label class="olLbl">GST Amount:</label>
								<input type="text" class="tbox" name="txtGSTA" >
							</div>
							<div class="input_box">
								<label class="olLbl">Net Amount:</label>
								<input type="text" class="tbox" name="txtNetA">
							</div>
						</div>
						<input type="submit" class="btn" name="btnUpd" value="Update">
						<input type="Button" class="btn" name="btnBack" value="Back" onclick="goBack()">
						<input type="submit" class= "btn" name="btnDel" value="Delete">
					</div>
				</div>
			</form>
		</section>
		<footer class="footer-distributed">
			<div class="footer-left">
				<img src="OSS Logo cart.png" class="logo logoimg" alt="One Stop Shop Logo cart image">
				<p class="footer-links">
					<a href="#" class="link-1">Home</a>
					<a href="#">Blog</a>
					<a href="#">Pricing</a>
					<a href="#">About</a>
					<a href="#">Faq</a>
					<a href="#">Contact</a>
				</p>
				<p class="footer-company-name">&copy; One Stop Shop Mega Mart - 2023</p>
			</div>
			<div class="footer-center">
				<div>
					<i class="fa fa-map-marker"></i>
					<p><span>Nayabazar</span> Cuttack, Odisha</p>
				</div>
				<div>
					<i class="phone"></i>
					<p>7978295957</p>
				</div>
				<div>
					<i class="fa fa-envelope"></i>
					<p><a href="mailto:od.badal07@gmail.com">od.badal07@gmail.com</a></p>
				</div>
			</div>
			<div class="footer-right">
				<p class="footer-company-about">
					<span>About the company</span>
					Lorem ipsum dolor sit amet, consectateur adispicing elit. Fusce euismod convallis velit, eu auctor lacus vehicula sit amet.
				</p>
				<div class="footer-icons">
					<a href="https://www.facebook.com/profile.php?id=100005385408616&sk=about"><i class="fa fa-facebook"><img src="facebook.png" class="social"></i></a>
					<a href="https://twitter.com/BadalSa38607542?t=6GjO6uAHJ89G4bLhRTmCQw&s=08"><i class="fa fa-twitter"><img src="twitter.png" class="social"></i></a>
					<a href="https://www.linkedin.com/in/badal-sahoo-056b90220"><i class="fa fa-linkedin"><img src="linkedin.png" class="social"></i></a>
					<a href="https://github.com/Badal712"><i class="fa fa-github"><img src="github.png" class="social"></i></a>

				</div>
			</div>
		</footer>
	</body>
</html>