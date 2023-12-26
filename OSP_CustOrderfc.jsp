<%@ page language="java" contentType="text/html" import="java.sql.*" %>
<%!
	Connection conn;
	Statement stmtArray, stmtproC, stmtOrSn;
	ResultSet rsArray, rsproC, rsOrSn;
	String orN, slN, orSl, dt[], mob[], pas[], nm[], loc[], ct[], cNum[], mid[], sN[], prodC[], prodN[], cate[], price[], orQ[], amo[];
	String proC, proN[], cat[], pri[];
	int i, on;
	
	
	public void doConnect(){
		
		try{
			Class.forName ("com.mysql.jdbc.Driver");
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
	dt = new String[20];
	mob = new String[20];
	pas = new String[20];
	nm = new String[20];
	loc = new String[20];
	ct = new String[20];
	cNum = new String[20];
	mid = new String[20];
	sN = new String[20];
	prodC = new String[20];
	prodN = new String[20];
	cate = new String[20];
	price = new String[20];
	orQ = new String[20];
	amo = new String[20];
	doConnect();
	
	try{
		stmtArray = conn.createStatement();
		rsArray = stmtArray.executeQuery("select * from osp_tblcustorder");
		i = 0;
		
		while(rsArray.next()){
			dt[i] = rsArray.getString("Order_Date");
			mob[i] = rsArray.getString("Mobile_Number");
			pas[i] = rsArray.getString("Password");
			nm[i] = rsArray.getString("Name");
			loc[i] = rsArray.getString("Locality");
			ct[i] = rsArray.getString("City");
			cNum[i] = rsArray.getString("Contant_Number");
			mid[i] = rsArray.getString("E_Mail");
			sN[i] = rsArray.getString("Sl_No");
			prodC[i] = rsArray.getString("Product_Code");
			prodN[i] = rsArray.getString("Product_Name");
			cate[i] = rsArray.getString("Category");
			price[i] = rsArray.getString("Price");
			orQ[i] = rsArray.getString("Order_Quantity");
			amo[i] = rsArray.getString("Amount");
			i++;
		}
	}
	catch(SQLException sqle){
		out.println("Unable to collect "+sqle);
	}
%>
<%
	proN = new String[20];
	cat = new String[20];
	pri = new String[20];
	doConnect();
	
	try{
		stmtArray = conn.createStatement();
		rsArray = stmtArray.executeQuery("select * from osp_tblproduct");
		i = 0;
		
		while(rsArray.next()){
			proN[i] = rsArray.getString("Product_Name");
			cat[i] = rsArray.getString("Product_Category");
			pri[i] = rsArray.getString("MRP");
			i++;
		}
	}
	catch(SQLException se){
		out.println("Unable to collect"+ se);
	}
%>
<html>
	<head>
		<title>Customer Order</title>
		<link rel="stylesheet" href="style.css">
		<script language="javascript">
			function goBack(){
				window.location = "OSP_CustOrderc.jsp";
			}
			function showData(){
				var jdt, jmob, jpas, jnm, jloc, jct, jcNum, jmid, jsN, jprodC, jprodN, jcate, jprice, jorQ, jamo;
				var i, j;
				
				jdt = new Array();
				jmob = new Array();
				jpas = new Array();
				jnm = new Array();
				jloc = new Array();
				jct = new Array();
				jcNum = new Array();
				jmid = new Array();
				jsN = new Array();
				jprodC = new Array();
				jprodN = new Array();
				jcate = new Array();
				jprice = new Array();
				jorQ = new Array();
				jamo = new Array();
				j = 0;
				
				<%
					i = 0;
					while(i < mid.length){
				%>
						jdt[j] = "<%=dt[i]%>";
						jmob[j] = "<%=mob[i]%>";
						jpas[j] = "<%=pas[i]%>";
						jnm[j] = "<%=nm[i]%>";
						jloc[j] = "<%=loc[i]%>";
						jct[j] = "<%=ct[i]%>";
						jcNum[j] = "<%=cNum[i]%>";
						jmid[j] = "<%=mid[i]%>";
						jsN[j] = "<%=sN[i]%>";
						jprodC[j] = "<%=prodC[i]%>";
						jprodN[j] = "<%=prodN[i]%>";
						jcate[j] = "<%=cate[i]%>";
						jprice[j] = "<%=price[i]%>";
						jorQ[j] = "<%=orQ[i]%>";
						jamo[j] = "<%=amo[i]%>";
						j++;
				<%
						i++;
					}
				%>
				k = document.f1.cmbOrdSl.selectedIndex;
				document.f1.dtDate.value = jdt[k-1];
				document.f1.txtMobN.value = jmob[k-1];
				document.f1.txtPass.value = jpas[k-1];
				document.f1.txtName.value = jnm[k-1];
				document.f1.txtLocal.value = jloc[k-1];
				document.f1.txtCt.value = jct[k-1];
				document.f1.txtConNum.value = jcNum[k-1];
				document.f1.txtMid.value = jmid[k-1];
				document.f1.txtSln.value = jsN[k-1];
				document.f1.cmbProC.value = jprodC[k-1];
				document.f1.txtProN.value = jprodN[k-1];
				document.f1.txtCat.value = jcate[k-1];
				document.f1.txtPri.value = jprice[k-1];
				document.f1.txtOrdQ.value = jorQ[k-1];
				document.f1.txtAmo.value = jamo[k-1];
			}
			function showTotal(){
				var jproN, jcat, jpri;
				var i, j;
				
				jproN = new Array();
				jcat = new Array();
				jpri = new Array();
				j = 0;
				<%
					i=0;
					while(i < proN.length){
				%>
						jproN[j] = "<%=proN[i]%>";
						jcat[j] = "<%=cat[i]%>";
						jpri[j] = "<%=pri[i]%>";
						j++;
				<%
						i++;
					}
				%>
				k = document.f1.cmbProC.selectedIndex;
				document.f1.txtProN.value = jproN[k-1];
				document.f1.txtCat.value = jcat[k-1];
				document.f1.txtPri.value = jpri[k-1];
				document.f1.txtOrdQ.value = "";
				document.f1.txtAmo.value = "";
			}
			function totalAmount(){
				var amo, qun, total;
				
				amo = parseInt(document.f1.txtPri.value);
				qun = parseInt(document.f1.txtOrdQ.value);
				total = amo*qun;
				
				document.f1.txtAmo.value = total;
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
			<form name="f1" action="OSP_CustOrderfs.jsp" method="post">
				<h2>Customer Order</h2>
				<div class="Main">
					<div class="box">
						<div class="row">
							<div class="input_box">
								<label class="lbl">Order Number :</label>
								<select name="cmbOrdSl" class="tbox" onchange="showData()">
									<option value="">--select--</option>
									<%
										doConnect();
										try{
											stmtOrSn = conn.createStatement();
											rsOrSn = stmtOrSn.executeQuery("select* from osp_tblcustorder");
											while(rsOrSn.next()){
												orN = rsOrSn.getString("Order_Number");
												slN = rsOrSn.getString("Sl_No");
												orSl =orN+"-"+slN;
									%>
										<option value="<%=orSl%>"><%=orSl%></option>
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
								<label class="lbl">Date :<font color="red">*</font></label>
								<input type="date" class="tbox" name="dtDate" required>
							</div>
						</div>
						<div class="row">
							<div class="input_box">
								<label class="lbl">Mobile Number :<font color="red">*</font></label>
								<input type="tel" class="tbox" name="txtMobN" required>
							</div>
							<div class="input_box">
								<label class="lbl">Password :</label>
								<input type="password" class="tbox" name="txtPass" required>
							</div>
							<div class="input_box">
								<input type="button" class="btn" name="btnShow" value="Show">
							</div>
						</div>
						<div class="row">
							<div class="input_box">
								<label class="lbl">Name :<font color="red">*</font></label>
								<input type="text" class="tbox" name="txtName" required readonly>
							</div>
						</div>
						<div class="row">
							<div class="input_box">
								<label class="lbl">Locality :</label>
								<input type="text" class="tbox" name="txtLocal" readonly>
							</div>
							<div class="input_box">
								<label class="lbl">City :</label>
								<input type="text" class="tbox" name="txtCt" readonly>
							</div>
						</div>
						<div class="row">
							<div class="input_box">
								<label class="lbl">Contact Number :</label>
								<input type="text" class="tbox" name="txtConNum" readonly>
							</div>
							<div class="input_box">
								<label class="lbl">E-Mail :<font color="red">*</font></label>
								<input type="text" class="tbox" name="txtMid" required readonly>
							</div>
						</div>
						<div class="row">
							<div class="input_box">
								<label class="lbl">Sl No.</label>
								<input type="text" class="tbox" name="txtSln">
							</div>
							<div class="input_box">
								<label class="lbl">Product Code</label>
								<select class="tbox" name="cmbProC" onchange="showTotal()">
									<option value="">--select--</option>
									<%
										doConnect();
										try{
											stmtproC = conn.createStatement();
											rsproC = stmtproC.executeQuery("select * from osp_tblproduct");
											while(rsproC.next()){
												proC = rsproC.getString("Product_Code");
									%>
									<option value="<%=proC%>"><%=proC%></option>
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
								<label class="lbl">Product Name</label>
								<input type="text" class="tbox" name="txtProN">
							</div>
							<div class="input_box">
								<label class="lbl">Category</label>
								<input type="text" class="tbox" name="txtCat">
							</div>
							<div class="input_box">
								<label class="lbl">Price</label>
								<input type="text" class="tbox" name="txtPri">
							</div>
							<div class="input_box">
								<label class="lbl">Order Quantity</label>
								<input type="text" class="tbox" name="txtOrdQ" onblur="totalAmount()">
							</div>
							<div class="input_box">
								<label class="lbl">Amount</label>
								<input type="text" class="tbox" name="txtAmo">
							</div>
						</div>
						<input type="submit" class="btn" name="btnUpd" value="Update">
						<input type="Button" class="btn" name="btnBack" value="Back" onclick="goBack()">
						<input type="submit" class= "btn" name="btnDel" value="Delete">
					</div>
				</div>
			</form>
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