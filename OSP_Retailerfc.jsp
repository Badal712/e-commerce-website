<%@ page language="java" contentType="text/html" import="java.sql.*" %>
<%!
	Connection conn;
	Statement stmt, stmtRetID, stmtPass, stmtArray;
	ResultSet rsretID, rsPass, rsArray;
	String retID[], pass, retName[], conPer[], local[], ct[], st[], phNo[], mid[], gstN[], gstD[], passWord[], repassWord[], pto[];
	int i;
	
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
<%
	retID = new String[20];
	retName= new String[20];
	conPer = new String[20];
	local = new String[20];
	ct = new String[20];
	st = new String[20];
	phNo = new String[20];
	mid = new String[20];
	gstN = new String[20];
	gstD = new String[20];
	passWord = new String[20];
	repassWord = new String[20];
	pto = new String[20];
	doConnect();
	try{
		stmtArray = conn.createStatement();
		rsArray = stmtArray.executeQuery("select * from osp_tblretailer");
		i=0;
		
		while(rsArray.next()){
			retID[i] = rsArray.getString("Retailer_ID");
			retName[i] = rsArray.getString("Retailer_Name");
			conPer[i] = rsArray.getString("Contact_Person");
			local[i] = rsArray.getString("Locality");
			ct[i] = rsArray.getString("City");
			st[i] = rsArray.getString("State");
			phNo[i] = rsArray.getString("Phone_Number");
			mid[i] = rsArray.getString("e_Mail");
			gstN[i] = rsArray.getString("GST_Number");
			gstD[i] = rsArray.getString("GST_Date");
			passWord[i] = rsArray.getString("Password");
			repassWord[i] = rsArray.getString("Confirm_Password");
			pto[i] = rsArray.getString("Photo");
			i = i+1;
		}
	}
	catch(SQLException sqle){
		out.println("Unable to collect "+sqle);
	}
%>
<html>
	<head>
		<title>Retailer Find Page</title>
		<link rel="stylesheet" href="mystyle.css">
		<script language="javascript">
			function goBack(){
				window.location="OSP_Retailerc.html"
			}
			function collectData(){
				alert("Hello");
				var jRetName, jConPer, jLocal, jCt, jSt, jPhNo, jMid, jgstN, jgstD, jpto, jPassWord, jrepassWord, jretID;
				var retid, pwd;
				var i, j, k;
				jretID = new Array();
				jRetName = new Array();
				jConPer = new Array();
				jLocal = new Array();
				jCt = new Array();
				jSt = new Array();
				jPhNo = new Array();
				jMid = new Array();
				jgstN = new Array();
				jgstD = new Array();
				jPassWord = new Array();
				jrepassWord = new Array();
				jpto = new Array();
				j=0;
				<%
					i=0;
					while(i<retName.length){
				%>
						jretID[j] = "<%=retID[i]%>";
						jRetName[j] ="<%=retName[i]%>";
						jConPer[j] = "<%=conPer[i]%>";
						jLocal[j] = "<%=local[i]%>";
						jCt[j] = "<%=ct[i]%>";
						jSt[j] = "<%=st[i]%>";
						jPhNo[j] = "<%=phNo[i]%>";
						jMid[j] = "<%=mid[i]%>";
						jgstN[j] = "<%=gstN[i]%>";
						jgstD[j] = "<%=gstD[i]%>";
						jPassWord[j] = "<%=passWord[i]%>";
						jrepassWord[j] = "<%=repassWord[i]%>";
						jpto[j] = "<%=pto[i]%>";
						j = j+1;
				<%
						i = i+1;
					}
				%>
				
				//collecting Retailer ID and Password From textfield
				retid = document.f1.txtRetID.value;
				pwd = document.f1.txtPass.value;
				j = 0;
				
			
				i=0;
				flag=0;
				while(j<jretID.length){
			
					if(jretID[j].localeCompare(retid)==0 && jPassWord[j].localeCompare(pwd)==0){
						
						k=j;
						document.f1.txtRetName.value=jRetName[k];
						document.f1.txtConPer.value=jConPer[k];
						document.f1.txtLocal.value=jLocal[k];
						document.f1.txtCity.value=jCt[k];
						document.f1.cmbState.value=jSt[k];
						document.f1.telPhNo.value=jPhNo[k];
						document.f1.txtmid.value=jMid[k];
						document.f1.txtGSTN.value=jgstN[k];
						document.f1.txtGSTD.value=jgstD[k];
						document.f1.txtPass.value=jPassWord[k];
						document.f1.txtRepassWord.value=jrepassWord[k];
						document.f1.imgPhoto.src=jpto[k];
						document.f1.hdnPhoto.value=jpto[k];
						flag=1;
						break;
					}
					j++;
				}
				if(flag==0){
					alert("Please enter valid Retailer ID and Password");
				}
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
			<form class="form" name="f1" action="OSP_Retailers.jsp" method="post">
				<h2>Retailer Information</h2>
				<div class="Main">
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
								<input type="button" name="btnCheck" class="btn" value="Check" onclick="collectData()">
							</div>
						</div>
					</div>
					<div class="box">
						<div class="input_box">
							<label class="lbl">Retailer Name :<label>
							<input type="text" name="txtRetName" class="tbox">
						</div>
						<div class="input_box">
							<label class="lbl">Contact Person :</label>
							<input type="text" name="txtConPer" class="tbox">
						</div>
						<div class="input_box">
							<label class="lbl">locality :</label>
							<input type="text" name="txtLocal" class="tbox">
						</div>
					</div>
					<div class="box">
						<div class="input_box">
							<img src="" name="imgPhoto" width="220px" height="350px" class="setImg">
							<input type="hidden" name="hdnPhoto">
						</div>
					</div>
					<div class="box_out">
						<div class="row">
							<div class="input_box">
								<label class="lbl">City :</label>
								<input type="text" name="txtCity" class="tbox">
							</div>
						</div>
						<div class="row">
							<div class="input_box">
								<label class="lbl">State / U-Territory :</label>
								<select name="cmbState" class="tbox">
									<option value="">--Select--</option>
									<option value="Andhra Pradesh">Andhra Pradesh</option>
									<option value = "Arunachal Pradesh">Arunachal Pradesh</option>
									<option value = "Assam">Assam</option>
									<option value = "Bihar">Bihar</option>
									<option value = "Chhattisgarh">Chhattisgarh</option>
									<option value = "Goa">Goa</option>
									<option value = "Gujarat">Gujarat</option>
									<option value = "Haryana">Haryana</option>
									<option value = "Himachal Pradesh">Himachal Pradesh</option>
									<option value = "Jharkhand">Jharkhand</option>
									<option value = "Karnataka">Karnataka</option>
									<option value = "Kerala">Kerala</option>
									<option value = "Madhya Pradesh">Madhya Pradesh</option>
									<option value = "Maharashtra">Maharashtra</option>
									<option value = "Manipur">Manipur</option>
									<option value = "Meghalaya">Meghalaya</option>
									<option value = "Mizoram">Mizoram</option>
									<option value = "Nagaland">Nagaland</option>
									<option value = "Odisha">Odisha</option>
									<option value = "Punjab">Punjab</option>
									<option value = "Rajasthan">Rajasthan</option>
									<option value = "Sikkim">Sikkim</option>
									<option value = "Tamil Nadu">Tamil Nadu</option>
									<option value = "Telangana">Telangana</option>
									<option value = "Tripura">Tripura</option>
									<option value = "Uttarakhand">Uttarakhand</option>
									<option value = "Uttar Pradesh">Uttar Pradesh</option>
									<option value = "West Bengal">West Bengal</option>
									<option value = "Andaman and Nicobar Islands">Andaman and Nicobar Islands</option>
									<option value = "Chandigarh">Chandigarh</option>
									<option value = "Dadra and Nagar Haveli and Daman & Diu">Dadra and Nagar Haveli and Daman & Diu</option>
									<option value = "Delhi">Delhi</option>
									<option value = "Jammu & Kashmir">Jammu & Kashmir</option>
									<option value = "Ladakh">Ladakh</option>
									<option value = "Lakshadweep">ULakshadweep</option>
									<option value = "Puducherry">Puducherry</option>	
								</select>
							</div>
						</div>
						<div class="row">
							<div class="input_box">
								<label class="lbl">Phone Number :</label>
								<input type="tel" name="telPhNo" class="tbox">
							</div>
							<div class="input_box">
								<label class="lbl">Email ID :</label>
								<input type="mail" name="txtmid" class="tbox">
							</div>
						</div>
						<div class="row">
							<div class="input_box">
								<label class="lbl">GST Number :</label>
								<input type="text" name="txtGSTN" class="tbox">
							</div>
							<div class="input_box">
								<label class="lbl">GST Date :</label>
								<input type="date" class="tbox" name="txtGSTD">
							</div>
						</div>
						<div class="row">
							<div class="input_box">
								<label class="lbl">Password :</label>
								<input type="passWordword" name="txtpassWord" class="tbox">
							</div>
							<div class="input_box">
								<label class="lbl">Confirm Password :</label>
								<input type="passWordword" name="txtRepassWord" class="tbox">
							</div>
						</div>
						<div class="row">
							<div class="input_box">
								<label class="lbl">Upload Photo :</label>
								<input type="file" name="filePhoto" class="tbox" onchange="">
							</div>
							<div class="input_box">
							
							</div>
						</div>
						<input type="Submit" name="btnUpdate" class="btn" value="Update">
						<input type="button" name="btnBack" class="btn" value="Back" onclick="goBack()">
						<input type="Submit" name="btnDel" class="btn" value="Delete">
					</div>
				<div>
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
in this page how to check user id in javascript and show other d