<%@ page language="java" contentType="text/html" import="java.sql.*" %>
<%!
	Connection conn;
	Statement stmtArray, stmtInvNum, stmtReqN, stmtPro;
	ResultSet rsArray, rsInvNum, rsReqN, rsPro;
	String invNo, sln, invSln, invDt[], requN[], requD[], suppN[], suppID[], loc[], cit[], phNum[], emid[], gstNum[], invT[], slNum[], prodId[], prodN[], cate[], price[], purQ[], Amo[], disc[], discP[], gstP[], gstAmo[], netA[];
	String reqNo, reqDt[], supN[], supID[], local[], ct[], phNo[], mid[], gstN[], sl[], prID[], prN[], categ[], pr[], pQ[], amount[];
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
	requN = new String[20];
	requD = new String[20];
	suppN = new String[20];
	suppID = new String[20];
	loc = new String[20];
	cit = new String[20];
	phNum = new String[20];
	emid = new String[20];
	gstNum = new String[20];
	invT = new String[20];
	slNum = new String[20];
	prodId = new String[20];
	prodN = new String[20];
	cate = new String[20];
	price = new String[20];
	purQ = new String[20];
	Amo = new String[20];
	disc = new String[20];
	discP = new String[20];
	gstP = new String[20];
	gstAmo = new String[20];
	netA = new String[20];
	doConnect();
		try{
			stmtArray = conn.createStatement();
			rsArray = stmtArray.executeQuery("select * from osp_tblrecgood");
			i = 0;
			
			while(rsArray.next()){
				invDt[i] = rsArray.getString("Invoice_Date");
				requN[i] = rsArray.getString("Requisition_Number");
				requD[i] = rsArray.getString("Requisition_Date");
				suppN[i] = rsArray.getString("Supplier_Name");
				suppID[i] = rsArray.getString("Supplier_ID");
				loc[i] = rsArray.getString("Locality");
				cit[i] = rsArray.getString("City");
				phNum[i] = rsArray.getString("Phone_Number");
				emid[i] = rsArray.getString("e_Mail");
				gstNum[i] = rsArray.getString("GST_Number");
				invT[i] = rsArray.getString("Invoice_Type");
				slNum[i] = rsArray.getString("Sl_No");
				prodId[i] = rsArray.getString("Product_ID");
				prodN[i] = rsArray.getString("Product_Name");
				cate[i] = rsArray.getString("Category");
				price[i] = rsArray.getString("Price");
				purQ[i] = rsArray.getString("Purchase_Quantity");
				Amo[i] = rsArray.getString("Amount");
				discP[i] = rsArray.getString("Discount_P");
				disc[i] = rsArray.getString("Discount_Amount");
				gstP[i] = rsArray.getString("GST_P");
				gstAmo[i] = rsArray.getString("GST_Amount");
				netA[i] = rsArray.getString("Net_Amount");
				i++;
			}
		}
		catch(SQLException se){
			System.out.println("Unable to collect data "+se);
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
		System.out.println("Unable to collect data "+sqle);
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
		function showInvInfo(){
			var jinvDt, jrequN, jrequD, jsuppN, jsuppID, jloc, jcit, jphNum, jemid, jgstNum, jinvT, jslNum, jprodId, jprodN, jcate, jprice, jpurQ, jAmo, jdisc, jdiscP, jgstP, jgstAmo, jnetA;
				var i, j;
				
			jinvDt = new Array();
			jrequN = new Array();
			jrequD = new Array();
			jsuppN = new Array();
			jsuppID = new Array();
			jloc = new Array();
			jcit = new Array();
			jphNum = new Array();
			jemid = new Array();
			jgstNum = new Array();
			jinvT = new Array();
			jslNum = new Array();
			jprodId = new Array();
			jprodN = new Array();
			jcate = new Array();
			jprice = new Array();
			jpurQ = new Array();
			jAmo = new Array();
			jdisc = new Array();
			jdiscP = new Array();
			jgstP = new Array();
			jgstAmo = new Array();
			jnetA = new Array();
			j = 0;
			<%
				i = 0;
				while(i < invDt.length){
			%>
					jinvDt[j] = "<%=invDt[i]%>";
					jrequN[j] = "<%=requN[i]%>";
					jrequD[j] = "<%=requD[i]%>";
					jsuppN[j] = "<%=suppN[i]%>";
					jsuppID[j] = "<%=suppID[i]%>";
					jloc[j] = "<%=loc[i]%>";
					jcit[j] = "<%=cit[i]%>";
					jphNum[j] = "<%=phNum[i]%>";
					jemid[j] = "<%=emid[i]%>";
					jgstNum[j] = "<%=gstNum[i]%>";
					jinvT[j] = "<%=invT[i]%>";
					jslNum[j] = "<%=slNum[i]%>";
					jprodId[j] = "<%=prodId[i]%>";
					jprodN[j] = "<%=prodN[i]%>";
					jcate[j] = "<%=cate[i]%>";
					jprice[j] = "<%=price[i]%>";
					jpurQ[j] = "<%=purQ[i]%>";
					jAmo[j] = "<%=Amo[i]%>";
					jdiscP[j] = "<%=discP[i]%>";
					jdisc[j] = "<%=disc[i]%>";
					jgstP[j] = "<%=gstP[i]%>";
					jgstAmo[j] = "<%=gstAmo[i]%>";
					jnetA[j] = "<%=netA[i]%>";
					j++;
			<%
					i++;
				}
			%>
			k = document.f1.cmbInvN.selectedIndex;
			document.f1.txtInvDt.value = jinvDt[k-1];
			document.f1.cmbReqN.value = jrequN[k-1];
			document.f1.txtReqDt.value = jrequD[k-1];
			document.f1.txtSupN.value = jsuppN[k-1];
			document.f1.txtSupID.value = jsuppID[k-1];
			document.f1.txtlocal.value = jloc[k-1];
			document.f1.txtCt.value = jcit[k-1];
			document.f1.txtphno.value = jphNum[k-1];
			document.f1.txtMid.value = jemid[k-1];
			document.f1.txtGSTN.value = jgstNum[k-1];
			document.f1.cmbInvType.value = jinvT[k-1];
			document.f1.numSlNo.value = jslNum[k-1];
			document.f1.cmbProID.value = jprodId[k-1];
			document.f1.txtProN.value = jprodN[k-1];
			document.f1.txtCat.value = jcate[k-1];
			document.f1.txtPri.value = jprice[k-1];
			document.f1.txtPurQ.value = jpurQ[k-1];
			document.f1.hdnPurQ.value = jpurQ[k-1];
			document.f1.txtAmo.value = jAmo[k-1];
			document.f1.txtDisA.value = jdisc[k-1];
			document.f1.txtDis.value = jdiscP[k-1];
			document.f1.txtGST.value = jgstP[k-1];
			document.f1.txtGSTA.value = jgstAmo[k-1];
			document.f1.txtNetA.value = jnetA[k-1];
		}
		</script>
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
				document.f1.txtPurQ.value = "";
				document.f1.txtAmo.value = "";
				document.f1.txtDisA.value = "";
				document.f1.txtDis.value = "";
				document.f1.txtGST.value = jgst[k-1];
				document.f1.txtGSTA.value = "";
				document.f1.txtNetA.value = "";
			}
			function showAmo(){
				var pri, qun, total;
				pri = parseInt(document.f1.txtPri.value);
				qun = parseInt(document.f1.txtPurQ.value);
				
				total = pri*qun;
				document.f1.txtAmo.value = total;
			}
			function showDisA(){
				var amo, disP, disA;
				amo = parseInt(document.f1.txtAmo.value);
				disP = parseInt(document.f1.txtDis.value);
				
				disA = disP/100*amo;
				document.f1.txtDisA.value = disA;
			}
			function showTotal(){
				
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
		</script>
		<script language ="javascript">
			function goBack(){
				window.location = "OSP_RecGoodc.jsp"
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
			<form name="f1" action="OSP_RecGoodfs.jsp" method="post">
				<h2>Receipt of Goods</h2>
				<div class="Main">
					<div class="box">
						<div class="row">
							<div class="input_box">
								<label class="lbl">Invoice Number :<font color="red">*</font></label>
								<select name="cmbInvN" class="tbox" onchange="showInvInfo()">
									<option value="">--select--</option>
									<%
										doConnect();
										try{
											stmtInvNum = conn.createStatement();
											rsInvNum = stmtInvNum.executeQuery("select * from osp_tblrecgood");
											while(rsInvNum.next()){
												invNo = rsInvNum.getString("Invoice_Number");
												sln = rsInvNum.getString("Sl_No");
												invSln = invNo+"-"+sln;
									%>
									<option value="<%=invSln%>"><%=invSln%></option>
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
								<label class="lbl">Requisition Date: </label>
								<input type="text" class="tbox" name="txtReqDt" readonly> 
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
								<input type="text" class="tbox" name="numSlNo">
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
								<input type="text" class="tbox" name="txtPurQ" onblur="showAmo()">
								<input type="hidden" name="hdnPurQ">
							</div>
							<div class="input_box">
								<label class="olLbl">Amount:</label>
								<input type="text" class="tbox" name="txtAmo">
							</div>
							<div class="input_box">
								<label class="olLbl">Discount %:</label>
								<input type="text" class="tbox" name="txtDis" onblur="showDisA()">
							</div>
							<div class="input_box">
								<label class="olLbl">Discount Amount:</label>
								<input type="text" class="tbox" name="txtDisA">
							</div>
							<div class="input_box">
								<label class="olLbl">GST %:</label>
								<input type="text" class="tbox" name="txtGST" readonly onblur="showTotal()">
							</div>
							<div class="input_box">
								<label class="olLbl">GST Amount:</label>
								<input type="text" class="tbox" name="txtGSTA">
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