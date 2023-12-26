<%@ page language="java" contentType="text/html" import="java.sql.*" %>
<%!
	Connection conn;
	Statement stmtArray, stmt, stmtSupID, stmtProC;
	ResultSet rsArray, rsSupID, rsproC, rsReqNo;
	String reqNo, supID[], supName[], dt[], local[], phNo[], ct[], gstN[], mid[], slNo[], proC[], proN[], cat[], pri[], qun[], amo[], rnsl, slN;
	String suppID, supN[], loc[], phoneN[], cit[], gstNum[], mail[]; 
	String prodC, proName[], cate[], price[];
	int i;
	
	public void doConnect(){
		try{
			Class.forName("com.mysql.jdbc.Driver");
		}
		catch(ClassNotFoundException cnfe){
			System.out.println("Unable to load Driver "+ cnfe);
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
	supID = new String[20];
	supName = new String[20];
	dt = new String[20];
	local = new String[20];
	phNo = new String[20];
	ct = new String[20];
	gstN = new String[20];
	mid = new String[20];
	slNo = new String[20];
	proC = new String[20];
	proN = new String[20];
	cat = new String[20];
	pri = new String[20];
	qun = new String[20];
	amo = new String[20];
	doConnect();
	
	try{
		stmtArray = conn.createStatement();
		rsArray = stmtArray.executeQuery("SELECT * FROM osp_tblsuppreg");
		i=0;
		
		while(rsArray.next()){
			supID[i] = rsArray.getString("Supplier_ID");
			supName[i] = rsArray.getString("Supplier_Name");
			dt[i] = rsArray.getString("Date");
			local[i] = rsArray.getString("Locality");
			phNo[i] = rsArray.getString("Phone_Number");
			ct[i] = rsArray.getString("City");
			gstN[i] = rsArray.getString("GST_Number");
			mid[i] = rsArray.getString("e_Mail");
			slNo[i] = rsArray.getString("SlNo");
			proC[i] = rsArray.getString("Product_Code"); 
			proN[i] = rsArray.getString("Product_Name");
			cat[i] = rsArray.getString("Category");
			pri[i] = rsArray.getString("Price");
			qun[i] = rsArray.getString("Quantity");
			amo[i] = rsArray.getString("Amount");
			i++;
		}
	}
	catch(SQLException sqle){
		out.println("Unable to collect data "+sqle);
	}
%>
<%
	supN = new String[20];
	loc = new String[20];
	phoneN = new String[20];
	cit = new String[20];
	gstNum = new String[20];
	mail = new String[20];
	doConnect();
	
	try{
		stmtArray = conn.createStatement();
		rsArray = stmtArray.executeQuery("select * from tblsup");
		i = 0;
		
		while(rsArray.next()){
			supN[i] = rsArray.getString("Supplier_ID");
			loc[i] = rsArray.getString("Locality");
			phoneN[i] = rsArray.getString("Phone_Number");
			cit[i] = rsArray.getString("City");
			gstNum[i] = rsArray.getString("GST_Number");
			mail[i] = rsArray.getString("e_Mail");
			i++;
		}
	}
	catch(SQLException se){
		out.println("Unable to collect data "+se);
	}
	
%>
<%
	proName = new String[20];
	cate = new String[20];
	price = new String[20];
	doConnect();
	
	try{
		stmtArray = conn.createStatement();
		rsArray = stmtArray.executeQuery("select * from osp_tblproduct");
		i=0;
		
		while(rsArray.next()){
			proName[i] = rsArray.getString("Product_Name");
			cate[i] = rsArray.getString("Product_Category");
			price[i] = rsArray.getString("Purchase_Price");
			i++;
		}
	}
	catch(SQLException sqle){
		out.println("Unable to collect product data "+sqle);
	}
	
%>
<html>
	<head>
		<title>Company Find Page</title>
		<link rel="stylesheet" href="style.css">
		<script language="javascript">
			function goBack(){
				window.location="OSP_SuppRegc.jsp";
			}
			function reqID(){
				var jsupID, jsupName, jdt, jlocal, jphNo, jct, jgstN, jmid, jslNo, jproC, jproN, jcat, jpri, jqun, jamo;
				var i, j;
				
				jsupID = new Array();
				jsupName = new Array();
				jdt = new Array();
				jlocal = new Array();
				jphNo = new Array();
				jct = new Array();
				jgstN = new Array();
				jmid = new Array();
				jslNo = new Array();
				jproC = new Array();
				jproN = new Array();
				jcat = new Array();
				jpri = new Array();
				jqun = new Array();
				jamo = new Array();
				
				j = 0;
				
				<%
				i=0;
				while(i < supID.length){
				%>
					jsupID[j] = "<%=supID[i]%>";
					jsupName[j] = "<%=supName[i]%>";
					jdt[j] = "<%=dt[i]%>";
					jlocal[j] = "<%=local[i]%>";
					jphNo[j] = "<%=phNo[i]%>";
					jct[j] = "<%=ct[i]%>";
					jgstN[j] = "<%=gstN[i]%>";
					jmid[j] = "<%=mid[i]%>";
					jslNo[j] = "<%=slNo[i]%>";
					jproC[j] = "<%=proC[i]%>";
					jproN[j] = "<%=proN[i]%>";
					jcat[j] = "<%=cat[i]%>";
					jpri[j] = "<%=pri[i]%>";
					jqun[j] = "<%=qun[i]%>";
					jamo[j] = "<%=amo[i]%>";
					j++;
				<%
					i++;
				}
				%>
				k = document.f1.cmbReqNum.selectedIndex;
				document.f1.cmbSupID.value=jsupID[k-1];
				document.f1.txtsupName.value=jsupName[k-1];
				document.f1.dtDate.value=jdt[k-1];
				document.f1.txtlocal.value=jlocal[k-1];
				document.f1.txtPhNo.value=jphNo[k-1];
				document.f1.txtCT.value=jct[k-1];
				document.f1.txtGSTN.value=jgstN[k-1];
				document.f1.txtmid.value=jmid[k-1];
				document.f1.txtslNo.value=jslNo[k-1];
				document.f1.cmbProC.value=jproC[k-1];
				document.f1.txtProname.value=jproN[k-1];
				document.f1.txtCat.value=jcat[k-1];
				document.f1.txtPri.value=jpri[k-1];
				document.f1.txtQun.value=jqun[k-1];
				document.f1.txtAmo.value=jamo[k-1];
			}
			function showSupID(){
				var jsupN, jloc, jphoneN, jcity, jgstNum, jmail;
				var i, j;
				
				jsupN = new Array();
				jloc = new Array();
				jphoneN = new Array();
				jcity = new Array();
				jgstNum = new Array();
				jmail = new Array();
				j = 0;
				
				<%
					i = 0;
					while(i < loc.length){
				%>
						jsupN[j] = "<%=supN[i]%>";
						jloc[j] = "<%=loc[i]%>";
						jphoneN[j] = "<%=phoneN[i]%>";
						jcity[j] = "<%=cit[i]%>";
						jgstNum[j]= "<%=gstNum[i]%>";
						jmail[j] = "<%=mail[i]%>";
						j++;
				<%
						i++;
					}
				%>
				k = document.f1.cmbSupID.selectedIndex;
				document.f1.txtsupName.value = jsupN[k-1];
				document.f1.txtlocal.value = jloc[k-1];
				document.f1.txtPhNo.value = jphoneN[k-1];
				document.f1.txtCT.value = jcity[k-1];
				document.f1.txtGSTN.value = jgstNum[k-1];
				document.f1.txtmid.value = jmail[k-1];
			}
			function productC(){
				var jprodN, jcate, jprice;
				var i,j;
				
				jprodN = new Array();
				jcate = new Array();
				jprice = new Array();
				j = 0;
				
				<%
					i=0;
					while(i < proName.length){
				%>
						jprodN[j] = "<%=proName[i]%>";
						jcate[j] = "<%=cate[i]%>";
						jprice[j] = "<%=price[i]%>";
						j++;
				<%
						i++;
					}
				%>
				k = document.f1.cmbProC.selectedIndex;
				document.f1.txtProname.value = jprodN[k-1];
				document.f1.txtCat.value = jcate[k-1];
				document.f1.txtPri.value = jprice[k-1];
				document.f1.txtQun.value = "";
				document.f1.txtAmo.value = "";
			}
			function totalQ(){
				var qun, price, total;
				//collecting data
				price = parseInt(document.f1.txtPri.value);
				qun = parseInt(document.f1.txtQun.value);
				//multipliction of two data
				total = qun*price;
				document.f1.txtAmo.value=total;
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
			<form name="f1" class="form" action="OSP_SuppRegfs.jsp" method="post">
				<h2>Supplier / Company Requisition</h2>
				<div class="Main">
					<div class="box_out">
						<div class="row">
							<div class="input_box">
								<label class="lbl">Requisition Number:</label>
								<select class="tbox" name="cmbReqNum" onchange="reqID()">
									<option value="">--select--</option>
									<%
										doConnect();
										try{
											stmt = conn.createStatement();
											rsReqNo = stmt.executeQuery("select * from osp_tblsuppreg");
											while(rsReqNo.next()){
												reqNo = rsReqNo.getString("Requisition_Number");
												slN = rsReqNo.getString("SlNo");
												rnsl = reqNo+" - "+slN;
									%>
									<option value="<%=rnsl%>"><%=rnsl%></option>
									<%
											}
										}
										catch(SQLException se){
											out.println("Unable to show data "+se);
										}
									%>
								</select>
							</div>
						</div>
						<div class="row">
							<div class="input_box">
								<label class="lbl">Date:</label>
								<input type="date" name="dtDate" class="tbox">
							</div>
							<div class="input_box">
								<label class="lbl">Supplier ID: </label>
								<select class="tbox" name="cmbSupID" onchange="showSupID()">
									<option value="">--select--</option>
									<%
										doConnect();
										try {
											stmtSupID = conn.createStatement();
											rsSupID = stmtSupID.executeQuery("select * from tblsup");
											while(rsSupID.next()){
												suppID = rsSupID.getString("Supplier_ID");
									%>
									<option value="<%=suppID%>"><%=suppID%></option>
									<%
											}
										}
										catch(SQLException sqle){
											out.println("Unable to show data "+sqle);
										}
									%>
								</select>
							</div>
						</div>
						<div class="row">
							
							<div class="input_box">
								<label class="lbl">Supplier Name:</label>
								<input type="text" class="tbox" name="txtsupName" readonly>
							</div>
							<div class="input_box">
								<label class="lbl">locality :</label>
								<input type="text" name="txtlocal" class="tbox" readonly>
							</div>	
						</div>
						<div class="row">
							<div class="input_box">
								<label class="lbl">Phone Number :</label>
								<input type="text" name="txtPhNo" class="tbox" readonly>
							</div>
							<div class="input_box">
								<label class="lbl">City</label>
								<input type="text" name="txtCT" class="tbox" readonly>
							</div>
						</div>
						<div class="row">
							<div class="input_box">
								<label class="lbl">GST Number :</label>
								<input type="text" name="txtGSTN" class="tbox" readonly>
							</div>
							<div class="input_box">
								<label class="lbl">E-Mail</label>
								<input type="mail" name="txtmid" class="tbox" readonly>
							</div>
						</div>
						
						<div class="row">
							<div class="input_box">
								<label class="lbl olLbl">Sl No. </label>
								<input type="text" class="tbox" name="txtslNo" readonly>
							</div>
							<div class="input_box">
								<label class="lbl olLbl">Product Code</label>
								<select name="cmbProC" class="tbox" onchange="productC()">
									<option value="">--select--</option>
									<%
										doConnect();
										try{
											stmtProC = conn.createStatement();
											rsproC = stmtProC.executeQuery("select * from osp_tblproduct");
											
											while(rsproC.next()){
												prodC = rsproC.getString("Product_Code");
									%>
									<option value="<%=prodC%>"><%=prodC%></option>
									<%
											}
										}
										catch(SQLException sqle){
											out.println("Unable to show data "+sqle);
										}
									%>
								</select>
							</div>
							<div class="input_box">
								<label class="lbl olLbl">Product Name</label>
								<input type="text" name="txtProname" class="tbox" readonly>
							</div>
							<div class="input_box">
								<label class="lbl olLbl">Category</label>
								<input type="text" name="txtCat" class="tbox" readonly>
							</div>
							<div class="input_box">
								<label class="lbl olLbl">Price</label>
								<input type="text" name="txtPri" class="tbox">
							</div>
							<div class="input_box">
								<label class="lbl olLbl">Quantity</label>
								<input type="text" name="txtQun" class="tbox" onblur="totalQ()">
							</div>
							<div class="input_box">
								<label class="lbl olLbl">Amount</label>
								<input type="text" name="txtAmo" class="tbox" >
							</div>
                            
						</div>
						<div class="show_data">
						
						</div>
						<input type="Submit" name="btnUpd" class="btn" value="Update">
						<input type="button" name="btnBack" class="btn" value="Back" onclick="goBack()">
						<input type="submit" name="btnDel" class="btn" value="Delete">
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
