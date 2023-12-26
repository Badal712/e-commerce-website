<%@ page language="java" contentType="text/html" import="java.sql.*" %>
<%!
	Connection conn;
	Statement stmtArray, stmtreqNum, stmtproCode;
	ResultSet rsArray, rsreqNum, rsproCode;
	String reqNo, sln, reqSl, dt[], reID[], pas[], retN[], loc[], cit[], phNum[], emid[], gstNum[], sNo[], prodC[], prodN[], cat[], pri[], quen[], amou[];
	String proC, proN[], cate[], price[];
	int i, rn;
	
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
	reID = new String[20];
	pas = new String[20];
	dt = new String[20];
	retN = new String[20];
	loc = new String[20];
	cit = new String[20];
	phNum = new String[20];
	emid = new String[20];
	gstNum = new String[20];
	sNo = new String[20];
	prodC = new String[20];
	prodN = new String[20];
	cat = new String[20];
	pri = new String[20];
	quen = new String[20];
	amou = new String[20];
	doConnect();

	try{
		stmtArray = conn.createStatement();
		rsArray = stmtArray.executeQuery("select * from osp_tblretreq");
		i=0;
		
		while(rsArray.next()){
			reID[i] = rsArray.getString("Retailer_ID");
			pas[i] = rsArray.getString("Password");
			dt[i] = rsArray.getString("Date");
			retN[i] = rsArray.getString("Retailer_Name");
			loc[i] = rsArray.getString("Locality");
			cit[i] = rsArray.getString("City");
			phNum[i] = rsArray.getString("Phone_Number");
			emid[i]  = rsArray.getString("E_Mail");
			gstNum[i] = rsArray.getString("GST_Number");
			sNo[i] = rsArray.getString("Sl_No");
			prodC[i] = rsArray.getString("Product_Code");
			prodN[i] = rsArray.getString("Product_Name");
			cat[i] = rsArray.getString("Category");
			pri[i] = rsArray.getString("Price");
			quen[i] = rsArray.getString("Quentity");
			amou[i] = rsArray.getString("Amount");
			i++;
		}
	}
	catch(SQLException se){
		System.out.println("Unable to collect "+se);
	}
%>
<%
	proN = new String[20];
	cate = new String[20];
	price = new String[20];
	doConnect();
	
	try{
		stmtArray = conn.createStatement();
		rsArray = stmtArray.executeQuery("select * from osp_tblproduct");
		i=0;
		
		while(rsArray.next()){
			proN[i] = rsArray.getString("Product_Name");
			cate[i] = rsArray.getString("Product_Category");
			price[i] = rsArray.getString("MRP");
			i=i+1;
		}
	}
	catch(SQLException se){
		out.println("Unable to collect data "+se);
	}
%>
<html>
	<head>
		<title>Retailer Requisition Page</title>
		<link rel="stylesheet" href="mystyle.css">
		<script language="javascript">
			function showReq(){
				var  jreID, jpas, jdt, jretN, jloc, jcit, jphNum, jemid, jgstNum, jsNo, jprodC, jprodN, jcat, jpri, jquen, jamou;
				var i, j;
				
				jreID = new Array();
				jpas = new Array();
				jdt = new Array();
				jretN = new Array();
				jloc =new Array();
				jcit = new Array();
				jphNum = new Array();
				jemid = new Array();
				jgstNum = new Array();
				jsNo = new Array();
				jprodC = new Array();
				jprodN = new Array();
				jcat = new Array();
				jpri = new Array();
				jquen = new Array();
				jamou = new String();
				j=0;
				
				<%
					i=0;
					while(i<loc.length){
				%>
						jreID[j] = "<%=reID[i]%>";
						jpas[j] = "<%=pas[i]%>";
						jdt[j] = "<%=dt[i]%>";
						jretN[j] = "<%=retN[i]%>";
						jloc[j] = "<%=loc[i]%>";
						jcit[j] = "<%=cit[i]%>";
						jphNum[j] = "<%=phNum[i]%>";
						jemid[j] = "<%=emid[i]%>";
						jgstNum[j] = "<%=gstNum[i]%>";
						jsNo[j] = "<%=sNo[i]%>";
						jprodC[j] = "<%=prodC[i]%>";
						jprodN[j] = "<%=prodN[i]%>";
						jcat[j] = "<%=cat[i]%>";
						jpri[j] = "<%=pri[i]%>";
						jquen[j] = "<%=quen[i]%>";
						jamou[j] = "<%=amou[i]%>";
						j++;
				<%
						i++;
					}
				%>
				k = document.f1.cmbReqNo.selectedIndex;
				document.f1.dtDate.value = jdt[k-1];
				document.f1.txtRetID.value = jreID[k-1];
				document.f1.txtPass.value = jpas[k-1];
				document.f1.txtName.value = jretN[k-1];
				document.f1.txtLocal.value = jloc[k-1];
				document.f1.txtCt.value = jcit[k-1];
				document.f1.txtphNo.value = jphNum[k-1];
				document.f1.txtMid.value = jemid[k-1];
				document.f1.txtgstNo.value = jgstNum[k-1];
				document.f1.txtslNo.value = jsNo[k-1];
				document.f1.cmbproCode.value = jprodC[k-1];
				document.f1.txtprN.value = jprodN[k-1];
				document.f1.txtcat.value = jcat[k-1];
				document.f1.txtPri.value = jpri[k-1];
				document.f1.txtQun.value = jquen[k-1];
				document.f1.txtAmo.value = jamou[k-1];
			}
			function showPro(){
				var jproN, jcate, jpri;
				var i, j;
				jproN = new Array();
				jcate = new Array();
				jpri = new Array();
				j = 0;
				<%
					i=0;
					while(i<proN.length){
				%>
						jproN[j] ="<%=proN[i]%>";
						jcate[j] ="<%=cate[i]%>";
						jpri[j] ="<%=price[i]%>";
						j++;
				<%
						i++;
					}
				%>
				k = document.f1.cmbproCode.selectedIndex;
				document.f1.txtprN.value=jproN[k-1];
				document.f1.txtcat.value=jcate[k-1];
				document.f1.txtPri.value=jpri[k-1];
				document.f1.txtQun.value="";
				document.f1.txtAmo.value="";
			}
			function showtotal(){
				var pri, qun, amo;
				
				pri = parseInt(document.f1.txtPri.value);
				qun = parseInt(document.f1.txtQun.value);
				
				amo = pri*qun;
				
				document.f1.txtAmo.value=amo;
			}
			function goBack(){
				window.location = "OSP_RetReqc.jsp";
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
			<form name="f1" action="OSP_RetReqfs.jsp" method="post">
				<h2>Retailer Requisition</h2>
				<div class="Main">
					<div class="box_out">
						<div class="row">
							<div class="input_box">
								<label name="lbl">Requisition Number :</label>
								<select class="tbox" name="cmbReqNo" onchange="showReq()">
									<option value="">--select--</option>
									<%
										doConnect();
										try{
											stmtreqNum = conn.createStatement();
											rsreqNum = stmtreqNum.executeQuery("select * from osp_tblretreq");
											while(rsreqNum.next()){
												reqNo = rsreqNum.getString("Requisition_Number");
												sln = rsreqNum.getString("Sl_No");
												reqSl = reqNo+ "-" +sln;
									%>
									<option value="<%=reqSl%>"><%=reqSl%></option>
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
								<label name="lbl">Date :</label>
								<input type="date" class="tbox" name="dtDate">
							</div>
						</div>
					</div>
					<div class="box_out">
						<div class="row">
							<div class="input_box">
								<label class="lbl">Retailer ID :</label>
								<input type="text" class="tbox" name="txtRetID">
							</div>
							<div class="input_box">
								<label class="lbl">Password :</label>
								<input type="password" class="tbox" name="txtPass">
							</div>
						</div>
					</div>
					<div class="box_out">
						<div class="row">
							<div class="input_box">
								<label class="lbl">Retailer Name :</label>
								<input type="text" class="tbox" name="txtName">
							</div>
							<div class="input_box">
								<label class="lbl">Locality :</label>
								<input type="text" class="tbox" name="txtLocal">
							</div>
						</div>
						<div class="row">
							<div class="input_box">
								<label class="lbl">City :</label>
								<input type="text" class="tbox" name="txtCt">
							</div>
							<div class="input_box">
								<label class="lbl">Phone Number :</label>
								<input type="tel" class="tbox" name="txtphNo">
							</div>
						</div>
						<div class="row">
							<div class="input_box">
								<label class="lbl">E-Mail :</label>
								<input type="mail" class="tbox" name="txtMid">
							</div>
							<div class="input_box">
								<label class="lbl">GST Number :</label>
								<input type="text" class="tbox" name="txtgstNo">
							</div>
						</div>
						<div class="row">
							<div class="input_box">
								<label class="lbl">Sl No.</label>
								<input type="text" class="tbox" name="txtslNo">
							</div>
							<div class="input_box">
								<label class="lbl">Pro-Code :</label>
								<select name="cmbproCode" class="tbox" onchange="showPro()">
									<option value="">--select--</option>
									<%
										doConnect();
										try{
											stmtproCode=conn.createStatement();
											rsproCode = stmtproCode.executeQuery("select * from osp_tblproduct");
											while(rsproCode.next()){
												proC = rsproCode.getString("Product_Code");
									%>
									<option value="<%=proC%>"><%=proC%></option>
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
								<label class="lbl">Pro-Name :</label>
								<input type="text" class="tbox" name="txtprN">
							</div>
							<div class="input_box">
								<label class="lbl">Category :</label>
								<input type="text" class="tbox" name="txtcat">
							</div>
							<div class="input_box">
								<label class="lbl">Price :</label>
								<input type="text" class="tbox" name="txtPri">
							</div>
							<div class="input_box">
								<label class="lbl">Quentity :</label>
								<input type="text" class="tbox" name="txtQun" onblur="showtotal()">
							</div>
							<div class="input_box">
								<label class="lbl">Amount :</label>
								<input type="text" class="tbox" name="txtAmo">
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