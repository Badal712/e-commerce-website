<%@ page language="java" contentType="text/html" import="java.sql.*" %>
<%!
	Connection conn;
	Statement stmt, stmtArray, stmtsupp;
	ResultSet rs, rsArray, rssupp;
	String retN, retID[], phNo[], mid[], gstN[];
	int i, vn;
	
	public void doConnect(){
		
		try{
			Class.forName("com.mysql.jdbc.Driver");
		}
		catch(ClassNotFoundException cnfe){
			System.out.println("Unable to load class "+cnfe);
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
		rs = stmt.executeQuery("select * from osp_tblreceiptvou");
		if(rs.last()){
			vn = rs.getRow();
		}
		else{
			vn = 0;
		}
		vn = vn+1;
	}
	catch(SQLException se){
		System.out.println("Unable to show "+se);
	}
%>
<%
	retID = new String[20];
	phNo = new String[20];
	mid = new String[20];
	gstN = new String[20];
	doConnect();
	
	try{
		stmtArray = conn.createStatement();
		rsArray = stmtArray.executeQuery("select * from osp_tblretailer");
		i = 0;
		
		while(rsArray.next()){
			retID[i] = rsArray.getString("Retailer_Name");
			phNo[i] = rsArray.getString("Phone_Number");
			mid[i] = rsArray.getString("e_Mail");
			gstN[i] = rsArray.getString("GST_Number");
			i++;
		}
	}
	catch(SQLException se){
		System.out.println("Unable to collect "+se);
	}
%>
<html>
	<head>
		<title>Receipt Vaucher</title>
		<link rel="stylesheet" href="mystyle.css">
		<script language="javascript">
			function goFind(){
				window.location = "OSP_ReceiptVoufc.jsp";
			}
			function showRet(){
				var jretID, jphNo, jmid, jgstN;
				var i, j;
				jretID = new Array();
				jphNo = new Array();
				jmid = new Array();
				jgstN = new Array();
				j = 0;
				<%
					i = 0;
					while(i<retID.length){
				%>
						jretID[j] = "<%=retID[i]%>";
						jphNo[j] = "<%=phNo[i]%>";
						jmid[j] = "<%=mid[i]%>";
						jgstN[j] = "<%=gstN[i]%>";
						j++;
				<%
						i++;
					}
				%>
				k = document.f1.cmbRetN.selectedIndex;
				document.f1.txtRetID.value = jretID[k-1];
				document.f1.telPhone.value = jphNo[k-1];
				document.f1.txtMail.value = jmid[k-1];
				document.f1.txtGSTN.value = jgstN[k-1];
				
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
			<form name="f1" action="OSP_ReceiptVous.jsp" method="post">
				<h2>Receipt Voucher</h2>
				<div class="Main">
					<div class="box">
						<div class="row">
							<div class="input_box">
								<label class="lbl">Voucher Number :</label>
								<input type="text" class="tbox" name="txtVouN" value="<%=vn%>" readonly>
							</div>
							<div class="input_box">
								<label class="lbl">Date :<font color="red">*</font></label>
								<input type="date" name="txtVouDt" class="tbox" required>
							</div>
						</div>
						<div class="row">
							<div class="input_box">
								<label class="lbl">Retailer Name :</label>
								<select name="cmbRetN" class="tbox" onchange = "showRet()">
									<option value="">--Select--</option>
									<%
										doConnect();
										try{
											stmtsupp = conn.createStatement();
											rssupp = stmtsupp.executeQuery("select * from osp_tblretailer");
											while(rssupp.next()){
												retN = rssupp.getString("Retailer_Name");
									%>
									<option value="<%=retN%>"><%=retN%></option>
									<%
											}
										}
										catch(SQLException se){
											out.println("Unable to collect data "+se);
										}
									%>
								</select>
							</div>
							<div class="input_box">
								<label class="lbl">Retailer ID :</label>
								<input type="text" name="txtRetID" class="tbox" readonly>
							</div>
						</div>
						<div class="row">
							<div class="input_box">
								<label class="lbl">Phone Number:</label>
								<input type="tel" name="telPhone" class="tbox" pattern="[0-9]{10}" readonly>
							</div>
							<div class="input_box">
								<label class="lbl">e-Mail :</label>
								<input type="email" name="txtMail" class="tbox" readonly>
							</div>
						</div>
						<div class="row">
							<div class="input_box">
								<label class="lbl">GST Number :</label>
								<input type="text" name="txtGSTN"class="tbox" readonly>
							</div>
							<div class="input_box">
								<label class="lbl">Payment Mode :</label>
								<select name="cmbPaymode" class="tbox">
									<option value="">--Select--</option>
									<option value="CASH">CASH</option>
									<option value="CHEQUE">CHEQUE</option>
									<option value="DRAFT">DRAFT</option>
									<option value="ONLINE">ONLINE</option>
								</select>
							</div>
						</div>
						<div class="row">
							<div class="input_box">
								<label class="lbl">Refernce Number :</label>
								<input type="text" class="tbox" name="txtRefNo">
							</div>
							<div class="input_box">
								<label class="lbl">Date :</label>
								<input type="date" name="txtRefDt" class="tbox" required>
							</div>
						</div>
						<div class="row">
							<div class="input_box">
								<label class="lbl">Bank :</label>
								<select name="cmbBank" class="tbox">
									<option value="">--select--</option>
									<option value="Allahabad Bank">Allahabad Bank</option>
									<option value="Axis Bank">Axis Bank</option>
									<option value="Bank of Baroda">Bank of Baroda</option>
									<option value="Bank of India">Bank of India
									<option value="Canara Bank">Canara Bank</option>
									<option value="Corporation Bank">Corporation Bank</option>
									<option value="Federal Bank">Federal Bank</option>
									<option value="ICICI Bank">ICICI Bank</option>
									<option value="IDBI Bank">IDBI Bank</option>
									<option value="Kotak Bank">Kotak Bank</option>
									<option value="Punjab National Bank">Punjab National Bank</option>
									<option value="State Bank of India">State Bank of India</option>
									<option value="Syndicate Bank">Syndicate Bank</option>
									<option value="UCO Bank">UCO Bank</option>
									<option value="Union Bank of India">Union Bank of India</option>
									<option value="Vijaya Bank">Vijaya Bank</option>
									<option value="Yes Bank Ltd">Yes Bank Ltd</option>
									
								</select>
							</div>
							<div class="input_box">
								<label class="lbl">Amount</label>
								<input type="text" name="txtAmo" class="tbox">
							</div>
						</div>
						<input type="Submit" name="btnSub" class="btn" value="Submit">
						<input type="button" name="btnFind" class="btn" value="Find" onclick="goFind()">
						<input type="reset" name="btnRes" class="btn" value="Reset">
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