<%@ page language="java" contentType="text/html" import="java.sql.*" %>
<%!
	Connection conn;
	Statement stmtArray, stmtproCode, stmt;
	ResultSet rsArray, rsproCode, rs;
	String retID[], pass[], retNa[], local[], ct[], phNo[], mid[], gstN[];
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
	doConnect();
	try{
		stmt = conn.createStatement();
		rs = stmt.executeQuery("select * from osp_tblretreq");
		if(rs.last()){
		    rn = rs.getRow();
		}
		else{
			rn=0;
		}
		rn=rn+1;
		System.out.println("Req No. "+rn);
	}
	catch(SQLException se){
		out.println("Unable to show"+se);
	}
%>
<%
	retID = new String[20];
	pass = new String[20];
	retNa = new String[20];
	local = new String[20];
	ct = new String[20];
	phNo = new String[20];
	mid = new String[20];
	gstN = new String[20];
	doConnect();
	
	try{
		stmtArray = conn.createStatement();
		rsArray = stmtArray.executeQuery("select * from osp_tblretailer");
		i = 0;
		
		while(rsArray.next()){
			retID[i] = rsArray.getString("Retailer_ID");
			pass[i] = rsArray.getString("Password");
			retNa[i] = rsArray.getString("Retailer_Name");
			local[i] = rsArray.getString("Locality");
			ct[i] = rsArray.getString("City");
			phNo[i] = rsArray.getString("Phone_Number");
			mid[i] = rsArray.getString("e_Mail");
			gstN[i] = rsArray.getString("GST_Number");
			i=i+1;
		}
	}
	catch(SQLException sqle){
		System.out.println("Unable to load data "+sqle);
	}
%>
<%
	proN = new String[50];
	cate = new String[50];
	price = new String[50];
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
			function findData(){
				var jretID, jpass, jretNa, jlocal, jct, jphNo, jmid, jgstN;
				var i, j;
				
				jretID = new Array();
				jpass = new Array();
				jretNa = new Array();
				jlocal = new Array();
				jct = new Array();
				jphNo = new Array();
				jmid = new Array();
				jgstN = new Array();
				j = 0;
				<%
					i = 0;
					while(i< retID.length){
				%>
						jretID[j] = "<%=retID[i]%>";
						jpass[j] = "<%=pass[i]%>";
						jretNa[j] = "<%=retNa[i]%>";
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
				retid = document.f1.txtRetID.value;
				pwd = document.f1.txtPass.value;
				j=0;
				flag=0;
				while(j<jlocal.length){
					if (jretID[j].localeCompare(retid)==0 && jpass[j].localeCompare(pwd)==0){
						
						k = j;
						document.f1.txtName.value=jretNa[k];
						document.f1.txtLocal.value=jlocal[k];
						document.f1.txtCt.value=jct[k];
						document.f1.txtphNo.value=jphNo[k];
						document.f1.txtMid.value=jmid[k];
						document.f1.txtgstNo.value=jgstN[k];
						flag = 1;
						break;
					}
					j++;
				}
				if(flag==0){
					alert("Please enter valid Retailer ID and Password");
				}
			}
			</script>
			<script language="javascript">
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
			}
			function showtotal(){
				var pri, qun, amo;
				
				pri = parseInt(document.f1.txtPri.value);
				qun = parseInt(document.f1.txtQun.value);
				
				amo = pri*qun;
				
				document.f1.txtAmo.value=amo;
			}
			function goFind(){
				window.location = "OSP_RetReqfc.jsp";
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
			<form name="f1" action="OSP_RetReqs.jsp" method="post">
				<h2>Retailer Requisition</h2>
				<div class="Main">
					<div class="box_out">
						<div class="row">
							<div class="input_box">
								<label name="lbl">Requisition Number :<font color="red">*</font></label>
								<input type="text" class="tbox" name="txtReqNo" value="<%=rn%>" readonly>
							</div>
							<div class="input_box">
								<label name="lbl">Date :</label>
								<input type="date" class="tbox" name="dtDate" required>
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
							<div class="input_box">
								<input type="button" name="btnCheck" class="btn" value="Check" onclick="findData()">
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
								<label class="lbl">Prd-Code :</label>
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
								<label class="lbl">Prd-Name :</label>
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