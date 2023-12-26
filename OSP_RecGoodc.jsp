<%@ page language="java" contentType="text/html" import="java.sql.*" %>
<%!
	Connection conn;
	Statement stmtArray, stmtReqN, stmtPro;
	ResultSet rsArray, rsReqN, rsPro;
	String reqNo, reqDt[], supN[], supID[], local[], ct[], phNo[], mid[], gstN[];
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
	reqDt = new String[20];
	supN = new String[20];
	supID = new String[20];
	local = new String[20];
	ct = new String[20];
	phNo = new String[20];
	mid = new String[20];
	gstN = new String[20];
	doConnect();
	
	try{
		stmtArray = conn.createStatement();
		rsArray = stmtArray.executeQuery("select * from osp_tblsuppreg");
		i = 0;
		
		while(rsArray.next()){
			reqDt[i] = rsArray.getString("Date");
			supN[i] = rsArray.getString("Supplier_Name");
			supID[i] = rsArray.getString("Supplier_ID");
			local[i] = rsArray.getString("Locality");
			ct[i] = rsArray.getString("City");
			phNo[i] = rsArray.getString("Phone_Number");
			mid[i] = rsArray.getString("e_Mail");
			gstN[i] = rsArray.getString("GST_Number");
			i++;
		}
	}
	catch(SQLException sqle){
		out.println("Unable to collect data "+sqle);
	}
%>
<%
	proN = new String[50];
	cat = new String[50];
	pri = new String[50];
	gst = new String[50];
	doConnect();
	
	try{
		stmtArray = conn.createStatement();
		rsArray = stmtArray.executeQuery("select * from osp_tblproduct");
		i = 0;
		
		while(rsArray.next()){
			proN[i] = rsArray.getString("Product_Name");
			cat[i] = rsArray.getString("Product_Category");
			pri[i] = rsArray.getString("Purchase_Price");
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
			function showReq(){				//Showing Requisition Data
				var jreqDt, jsupN, jsupID, jlocal, jct, jphNo, jmid, jgstN;
				var i, j;
				
				jreqDt = new Array();
				jsupN = new Array();
				jsupID = new Array();
				jlocal = new Array();
				jct = new Array();
				jphNo = new Array();
				jmid = new Array();
				jgstN = new Array();
				j = 0;
				
				<%
					i = 0;
					while(i < reqDt.length){
				%>
						jreqDt[j] = "<%=reqDt[i]%>";
						jsupN[j] = "<%=supN[i]%>";
						jsupID[j] = "<%=supID[i]%>";
						jlocal[j] = "<%=local[i]%>";
						jct[j] = "<%=ct[i]%>";
						jphNo[j] = "<%=phNo[i]%>";
						jmid[j] = "<%=mid[i]%>";
						jgstN[j] = "<%=gstN[i]%>";
						j++;
				<%
						i++;
					}
				%>
				k = document.f1.cmbReqN.selectedIndex;
				document.f1.txtReqDt.value = jreqDt[k-1];
				document.f1.txtSupN.value = jsupN[k-1];
				document.f1.txtSupID.value = jsupID[k-1];
				document.f1.txtlocal.value = jlocal[k-1];
				document.f1.txtCt.value = jct[k-1];
				document.f1.txtphno.value = jphNo[k-1];
				document.f1.txtMid.value = jmid[k-1];
				document.f1.txtGSTN.value = jgstN[k-1];
				
			}
			function showProduct(){
				var jproN, jcat, jpri, jgst;
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
				qun = parseInt(document.f1.txtPurQ.value);
				
				total = qun*price;
				document.f1.txtAmo.value=total;
			}
			function showData(){
				var amt, disP, disA;
				amt = parseInt(document.f1.txtAmo.value);
				dis = parseInt(document.f1.txtDis.value);
				disA = dis/100*amt;
				document.f1.txtDisA.value=disA;
			}
			function showGst(){
				var amt, gstP, gstA, nAmo, disA, fAmo;
				amt = parseInt(document.f1.txtAmo.value);
				gstP = parseInt(document.f1.txtGST.value);
				disA = parseInt(document.f1.txtDisA.value);
				
				nAmo = amt-disA;
				gstA = gstP/100*nAmo;
				document.f1.txtGSTA.value=gstA;
				fAmo = nAmo+gstA;
				document.f1.txtNetA.value = fAmo;
				
				
			}
			function finalAmo(){
				var amo, disA, nAmo, fAmo, gstA;
				amo = parseInt(document.f1.txtAmo.value);
				gstA = parseInt(document.f1.txtGSTA.value);
				disA = parseInt(document.f1.txtDisA.value);
				
				nAmo = amo-disA;
				fAmo = nAmo+gstA;
				document.f1.txtNetA.value = fAmo;
			}
			function goFind(){
				window.location = "OSP_RecGoodfc.jsp"
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
			<form name="f1" action="OSP_RecGoods.jsp" method="post">
				<h2>Receipt of Goods</h2>
				<div class="Main">
					<div class="box">
						<div class="row">
							<div class="input_box">
								<label class="lbl">Invoice Number :<font color="red">*</font></label>
								<input type="text" name="txtInvN" class="tbox" required>
							</div>
							<div class="input_box">
								<label class="lbl">Invoice Date :<font color="red">*</font></label>
								<input type="date" name="txtInvDt" class="tbox" required>
							</div>
						</div>
						<div class="row">
							<div class="input_box">
								<label class="lbl">Requisition Number:</label>
								<select class="tbox" name="cmbReqN" onchange="showReq()">
									<option value="">--select--</option>
									<%
										doConnect();
										try{
											stmtReqN = conn.createStatement();
											rsReqN = stmtReqN.executeQuery("select distinct Requisition_Number from osp_tblsuppreg");
											while(rsReqN.next()){
												reqNo = rsReqN.getString("Requisition_Number");
									%>
									<option value="<%=reqNo%>"><%=reqNo%></option>
									<%
											}
										}
										catch(SQLException se){
											out.println("Unable to show "+se);
										}
									%>
								</select>
							</div>
							<div class="input_box">
								<label class="lbl">Requisition Date:</label>
								<input type="date" class="tbox" name="txtReqDt" readonly> 
							</div>
						</div>
						<div class="row">
							<div class="input_box">
								<label class="lbl">Supplier Name:</label>
								<input type="text" class="tbox" name="txtSupN" readonly>
							</div>
							<div class="input_box">
								<label class="lbl">Supplier ID:</label>
								<input type="text" class="tbox" name="txtSupID" readonly>
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
								<label class="lbl">Phone Number :</label>
								<input type="text" name="txtphno" class="tbox" readonly>
							</div>
							<div class="input_box">
								<label class="lbl">E Mail</label>
								<input type="text" name="txtMid" class="tbox" readonly>
							</div>
						</div>
						<div class="row">
							<div class="input_box">
								<label class = "lbl">GST Number :</label>
								<input type="text" name="txtGSTN" class="tbox" readonly>
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
								<select class="tbox" name="cmbProID" onchange="showProduct()">
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
								<label class="olLbl">Purchase Quantity:</label>
								<input type="text" class="tbox" name="txtPurQ" onblur="showAmount()">
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
								<input type="text" class="tbox" name="txtGSTA" onblur="showGst()">
							</div>
							<div class="input_box">
								<label class="olLbl">Net Amount:</label>
								<input type="text" class="tbox" name="txtNetA">
							</div>
						</div>
						<input type="submit" class="btn" name="btnSub" value="Submit">
						<input type="Button" class="btn" name="btnFind" value="Find" onclick="goFind()">
						<input type="Reset" class= "btn" name="btnRes" value="Reset">
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