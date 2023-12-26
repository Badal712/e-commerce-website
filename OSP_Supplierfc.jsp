<%@ page language="java" contentType="text/html" import= "java.sql.*"%>
<%!
	Statement stmt, stmtArray;
	Connection conn;
	ResultSet rsSupID, rsArray;
	String supID, supName[], conPer[], local[], city[], state[], phNo[], mid[], gstN[], gstD[];
	int i;
	
	public void doConnect(){
		
		try{
			Class.forName("com.mysql.jdbc.Driver");
		}
		catch(ClassNotFoundException cnfe){
			System.out.println("unable to load driver "+cnfe);
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
	supName = new String[30];
	conPer = new String[30];
	local = new String[30];
	city = new String[30];
	state = new String[30];
	phNo = new String[30];
	mid = new String[30];
	gstN = new String[30];
	gstD = new String[30];
	
	doConnect();
	
	try{
		stmtArray = conn.createStatement();
		rsArray=stmtArray.executeQuery("select * from tblsup");
		i = 0;
		
		while (rsArray.next()){
			supName[i] = rsArray.getString("Supplier_Name");
			conPer[i] = rsArray.getString("Contact_Person");
			local[i] = rsArray.getString("Locality");
			city[i] = rsArray.getString("City");
			state[i] = rsArray.getString("State");
			phNo[i] = rsArray.getString("Phone_Number");
			mid[i] = rsArray.getString("e_Mail");
			gstN[i] = rsArray.getString("GST_Number");
			gstD[i] = rsArray.getString("GST_Date");
			
			i = i+1;
		}
	}
	catch(SQLException sqle){
		out.println("Array con not be filled "+sqle);
	}
%>
<html>
	<head>
		<title>Supplier information</title>
		<link rel="stylesheet" href="mystyle.css">
		<script language="javascript">
			function goBack() {
				window.location = "OSP_Supplierc.html"
			}
			function suppInfo(){
				var jsupName, jconPer, jlocal, jct, jst, jphNo, jmid, jgstn, jgstd;
				var i, j;
				
				
				jsupName = new Array();
				jconPer = new Array();
				jlocal = new Array();
				jct = new Array();
				jst = new Array();
				jphNo = new Array();
				jmid = new Array();
				jgstn = new Array();
				jgstd = new Array();
				
				j = 0;
				<%
					i = 0;
					while(i<supName.length){
				%>
						jsupName[j] = "<%=supName[i]%>";
						jconPer[j] = "<%=conPer[i]%>";
						jlocal[j] = "<%=local[i]%>";
						jct[j] = "<%=city[i]%>";
						jst[j] = "<%=state[i]%>";
						jphNo[j] = "<%=phNo[i]%>";
						jmid[j] = "<%=mid[i]%>";
						jgstn[j] = "<%=gstN[i]%>";
						jgstd[j] = "<%=gstD[i]%>";
						
						j = j+1;
				<%
						i = i+1;
					}
				%>
				k=document.f1.cmbSupId.selectedIndex;
				document.f1.txtsupName.value=jsupName[k-1];
				document.f1.txtConPer.value=jconPer[k-1];
				document.f1.txtlocal.value=jlocal[k-1];
				document.f1.txtCT.value=jct[k-1];
				document.f1.txtST.value=jst[k-1];
				document.f1.txtphNo.value=jphNo[k-1];
				document.f1.txtmid.value=jmid[k-1];
				document.f1.txtgstN.value=jgstn[k-1];
				document.f1.txtgstD.value=jgstd[k-1];
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
			<form name="f1" class="form" action="OSP_Supplierfs.jsp" method="post">
				<h2>Supplier Information</h2>
				<div class="Main">
						<div class="box">
						<div class="input_box">
							<label class="lbl">Supplier ID</label>
							<select name="cmbSupId" class="tbox" onChange="suppInfo()">
								<option value="">--Select--</option>
								<%
									doConnect();
									try{
										stmt = conn.createStatement();
										rsSupID = stmt.executeQuery("select * from tblsup");
										
										while(rsSupID.next()){
											supID = rsSupID.getString("Supplier_ID");
								%>
								<option value="<%=supID%>"><%=supID%></option>
								<%
										}
									}
									catch(SQLException se){
										out.println("Unable to load "+se);
									}
								%>
							</select>
						<div class="text_box">
							<label class="lbl">Supplier Name</label>
							<input type="text" class="tbox" name="txtsupName">
						</div>
						<div class="input_box">
							<label class="">Contact Person<label>
							<input type="text" class="tbox" name="txtConPer">
						</div>
						<div class="input_box">
							<label class="lbl">Locality</label>
							<input type="text" class="tbox" name="txtlocal">
						</div>
						<div class="input_box">
							<label class="lbl">City</label>
							<input type="text" class="tbox" name="txtCT">
						</div>
						<div class="input_box">
							<label class="lbl">State</label>
							<input type="text" class="tbox" name="txtST">
						</div>
						<div class="row">
							<div class="input_box">
								<label class="lbl">Phone Number :</label>
								<input type="text" class="tbox" name="txtphNo">
							</div>
							<div class="input_box">
								<label class="lbl">e-Mail :</label>
								<input type="text" class="tbox" name="txtmid">
							</div>
						</div>
						<div class="row">
							<div class="input_box">
								<label class="lbl">GST Number :</label>
								<input type="text" class="tbox" name="txtgstN">
							</div>
							<div class="input_box">
								<label class="lbl">GST Date</label>
								<input type="text" class="tbox" name="txtgstD">
							</div>
						</div>
					</div>
					<input type="Submit" name="btnUpd" class="btn" value="Update">
					<input type="Submit" name="btnDel" class="btn" value="Delete">
					<input type="button" name="btnBack" class="btn" value="Back" onclick="goBack()">
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