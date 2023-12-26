<%@ page language="java" contentType="text/html" import="java.sql.*"%>

<%!
	Statement stmt, stmtArray;
	ResultSet rsRegdNo, rsArray;
	Connection conn;
	String regdNo, dates[], orgNames[], headsofOrg[], loc[], city[], state[], phNos[], mids[], gstN[], gstD[];
	int i;
	
	public void doConnect() {
			
		try{
			Class.forName("com.mysql.jdbc.Driver");
		}
		
		catch(ClassNotFoundException cnfe){
			System.out.println("Unable to load driver "+cnfe);
		}
		
		try{
			conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/ospdb","root","root");
		}
		catch(SQLException se){
			System.out.println("Unable to connect "+se);
		}
	}
%>
<%
	dates = new String [40];
	orgNames = new String [40];
	headsofOrg = new String [40];
	loc = new String [40];
	city = new String [40];
	state = new String [40];
	phNos = new String [40];
	mids = new String [40];
	gstN = new String [40];
	gstD = new String [40];
	
	doConnect();
	
	try {
		stmtArray=conn.createStatement();
		rsArray=stmtArray.executeQuery("select * from tblorgn");
		i = 0;
		
		while(rsArray.next()) {
			dates[i]=rsArray.getString("DATE");
			orgNames[i] = rsArray.getString("Organization_Name");
			headsofOrg[i] = rsArray.getString("Head_of_Organization");
			loc[i] = rsArray.getString("Locality");
			city[i] = rsArray.getString("City");
			state[i] = rsArray.getString("State");
			phNos[i] = rsArray.getString("Phone_Number");
			mids[i] = rsArray.getString("e_Mail");
			gstN[i] = rsArray.getString("GST_Number");
			gstD[i] = rsArray.getString("GST_Date");
			i = i+1;
			
		}
	}
	catch(SQLException se){
		out.println("Array cannot be filled "+se);
	}
%>
<html>
	<head>
		<title>Find Page</title>
		<link rel="stylesheet" href="mystyle.css">
		<script language="javascript">
			function OrgDetails () {
				var jdt, jOrgName, jHead, jLocal, jCity, jState, jphNo, jGSTNo, JGSTDt, jmid;
				var i, j;
				
				jdt = new Array();
				jOrgName = new Array();
				jhead = new Array();
				jLocal = new Array();
				jCity = new Array();
				jState = new Array();
				jphNo = new Array();
				jGSTNo = new Array();
				jGSTDt = new Array();
				jmid = new Array();
				
				
				j=0;
				<%
					i=0;
					while(i<orgNames.length){
				%>
				
						jdt[j] = "<%=dates[i]%>";
						jOrgName[j] ="<%=orgNames[i]%>";
						jhead[j] = "<%=headsofOrg[i]%>";
						jLocal[j] = "<%=loc[i]%>";
						jCity[j] = "<%=city[i]%>";
						jState[j] = "<%=state[i]%>";
						jphNo[j] = "<%=phNos[i]%>";
						jGSTNo[j] ="<%=gstN[i]%>";
						jGSTDt[j] = "<%=gstD[i]%>";
						jmid[j] =  "<%=mids[i]%>";
						j=j+1;
				<%
						i = i+1;
					}
				%>	
				
				k=document.f1.cmbRegdNo.selectedIndex;			
				document.f1.txtDate.value=jdt[k-1];
				document.f1.txtOrgName.value=jOrgName[k-1];
				document.f1.txtHOrg.value=jhead[k-1];
				document.f1.txtLoc.value=jLocal[k-1];
				document.f1.txtCity.value=jCity[k-1];
				document.f1.txtState.value=jState[k-1];
				document.f1.txtTelNo.value=jphNo[k-1];
				document.f1.txtGSTNo.value=jGSTNo[k-1];
				document.f1.txtmid.value=jmid[k-1];
				document.f1.txtGSTDt.value=jGSTDt[k-1];
				
			}
			
			function goBack(){
				window.location="OSP_Orgnc.html";
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
			<form name="f1" class="form" action="OSP_Orgfs.jsp" method="post">
				<h2>Organization Information</h2>
				<div class="Main">
					<div class="box">
						<div class="row">
							<div class="input_box">
								<label class="lbl">Registration No. :</label>
								<select name="cmbRegdNo" class="tbox" onchange="OrgDetails()">
									<option value="">--select--</option>
									<%
										doConnect();
										try{
											stmt = conn.createStatement();
											rsRegdNo = stmt.executeQuery("select * from tblorgn");
											
											while (rsRegdNo.next()){
												regdNo=rsRegdNo.getString("Registration_Number");
									%>
									<option value="<%=regdNo%>"><%=regdNo%></option>
									<%
											}
										}
										catch(SQLException se){
											out.println("Unable to create "+se);
										}
									%>
								</select>
							</div>
							<div class="input_box">
								<label class="lbl">Date</label>
								<input type="text" class="tbox" name="txtDate">
							</div>
						</div>
						<div class="input_box">
							<label class="lbl">Organization Name :</label>
							<input type="text" class="tbox" name="txtOrgName">
						</div>
						<div class="input_box">
							<label class="lbl">Head of Organization :</label>
							<input type="text" name="txtHOrg" class="tbox">
						</div>
						<div class="input_box">
							<label class="lbl">Locality :</label>
							<input type="text" name="txtLoc" class="tbox">
						</div>
						<div class="input_box">
							<label class="lbl">City :</label>
							<input type="text" name="txtCity" class="tbox">
						</div>
						<div class="input_box">
							<label class="lbl">State :</label>
							<input type="text" name="txtState" class="tbox">
						</div>
						<div class="row">
							<div class="input_box">
								<label class="lbl">Phone Number</label>
								<input type="text" class="tbox" name="txtTelNo">
							</div>
							<div class="input_box">
								<label class="rbl">e Mail :</label>
								<input type="text" class="tbox" name="txtmid">
							</div>
						</div>
						<div class="row">
							<div class="input_box">
								<label class="lbl">GST Number :</label>
								<input type="text" class="tbox" name="txtGSTNo">
							</div>
							<div class="input_box">
								<label class="rbl">GST Date :</label>
								<input type="text" class="tbox" name="txtGSTDt">
							</div>
						</div>
						
						<input type="Submit" name="btnUpd" class="btn" value="Update">
						<input type="Submit" name="btnDel" class="btn" value="Delete">
						<input type="button" name="btnBack" class="btn" value="Back" onclick="goBack()">
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
	<body>
</html>