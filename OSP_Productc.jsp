<%@ page language="java" contentType="text/html" import="java.sql.*"%>
<%!
	Connection conn;
	Statement stmt, stmtSup, stmtPro;
	ResultSet rsSupName, rsProCat;
	String supName, supCode[], proCat, proCC[];
	int i;
	
	public void doConnect(){
		
		try{
			Class.forName("com.mysql.jdbc.Driver");
		}
		catch(ClassNotFoundException cnfe){
			System.out.println("Unable to load Driver "+cnfe);
		}
		
		//Connecting to database
		try{
			conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/ospdb","root","root");
		}
		catch(SQLException se){
			System.out.println("Unable to Connect "+se);
		}
	}
%>
<%
	supCode = new String[20];
	proCC = new String[20];
	doConnect();
	
	try{
		stmtSup = conn.createStatement();
		rsSupName = stmtSup.executeQuery("select * from tblsup");
		i=0;
		
		while(rsSupName.next()){
			supCode[i] = rsSupName.getString("Supplier_ID");
			i = i+1;
		}
	}
	catch(SQLException se){
		out.println("Unable to collecting data "+se);
	}
	
	try{
		stmtPro = conn.createStatement();
		rsProCat = stmtPro.executeQuery("select * from osp_tblprodcat");
		i=0;
		
		while(rsProCat.next()){
			proCC[i] = rsProCat.getString("Product_Category_Code");
			i = i+1;
		}
	}
	catch(SQLException sqle){
		out.println("Unable to collecting data "+sqle);
	}
%>
<html>
	<head>
		<head>Product Information</head>
		<link rel="stylesheet" href="mystyle.css">
		<script lnguage="javascript">
			function supplierData(){
				var jSupCode;
				var i, j;
				
				jSupCode = new Array();
				j=0;
				
				<%
					i=0;
					while(i < supCode.length){
				%>
						jSupCode[j] = "<%=supCode[i]%>";
						j = j+1;
				<%
					i=i+1;
					}
				%>
				k=document.f1.cmbSupName.selectedIndex;
				document.f1.txtSupCode.value=jSupCode[k-1];
			}
			function productData(){
				var jproCode;
				var i, j;
				
				jproCode = new Array();
				j=0;
				
				<%
					i=0;
					while(i < proCC.length){
				%>	
						jproCode[j] = "<%=proCC[i]%>";
						j = j+1;
				<%
					i=i+1;
					}
				%>
				k=document.f1.cmbProCat.selectedIndex;
				document.f1.txtPCC.value=jproCode[k-1];
			}
			
			function showProductImage(){
			    var path,file;
				path=document.f1.fileImage.value;
				file=path.substring(path.lastIndexOf("\\")+1);
				document.f1.imgPhoto.src=file;
			}
			function goFind(){
				window.location="OSP_Productfc.jsp"
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
			<form name="f1" class="form" action="OSP_Products.jsp" method="post">
				<h2>Product Information</h2>
                <div class="Main">
					<div class="box">
						<div class="input_box">
							<label class="lbl">Supplier Name :</label>
							<select class="tbox" name="cmbSupName" onchange="supplierData()">
								<option value="">--select--</option>
								<%
									doConnect();
									try{
										stmt=conn.createStatement();
										rsSupName = stmt.executeQuery("select * from tblsup");
										while(rsSupName.next()){
											supName = rsSupName.getString("Supplier_Name");
								%>
								<option value="<%=supName%>"><%=supName%></option>
								<%
										}
									}
									catch(SQLException sqle){
										out.println("Unable to load "+sqle);
								
									}
									%>
							</select>
						</div>
						<div class="input_box">
							<label class="lbl">Supplier Code :</label>
							<input type="text" name="txtSupCode" class="tbox">
						</div>
						<div class="input_box">
							<label class="lbl">Product Category :</label>
							<select class="tbox" name="cmbProCat" onchange="productData()">
								<option value="">--select--</option>
								<%
									doConnect();
									try{
										stmt=conn.createStatement();
										rsProCat = stmt.executeQuery("select * from osp_tblprodcat");
										
										while(rsProCat.next()){
											proCat = rsProCat.getString("Product_Category_Name");
								%>
								<option value="<%=proCat%>"><%=proCat%></option>
								<%
										}
									}
									catch(SQLException se){
										out.println("Unable to show "+se);
									}
								%>
								
							</select>
						</div>
					</div>
                    <div class="box">
						<img src="" name="imgPhoto" width="220px">
					</div>
					<div class="box_out">
						<div class="row">
							<div class="input_box">
								<label class="lbl">Product Category Code :</label>
								<input type="text" name="txtPCC" class="tbox">
							</div>
						</div>
						
                        <div class="row">
                            <div class="input_box">
                                <label class="lbl">Product Code :</label>
                                <input type="text" name="txtProdCode" class="tbox">
                            </div>
                        </div>
                        <div class="row">
                            <div class="input_box">
                                <label class="lbl">Product Name :</label>
                                <input type="text" name="txtProdName" class="tbox">
                            </div>
						</div>
						<div class="row">
                            <div class="input_box">
                                <label class="lbl">Unit</label>
                                <input type="text" name="txtUnit" class="tbox">
                            </div>
                        </div>
						<div class="row">
							<div class="input_box">
								<label class="lbl">Purchase Price</label>
								<input type="text" name="txtPurPrice" class="tbox">
							</div>
							<div class="input_box">
								<label class="lbl">M.R.P :</label>
								<input type="text" class="tbox" name="txtMRP">
							</div>
						</div>
						<div class="row">
							<div class="input_box">
								<label class="lbl">Tax Slab :</label>
								<select class="tbox" name="cmbTaxslab">
									<option value="">--select--</option>
									<option value="8">8%</option>
									<option value="12">12%</option>
									<option value="18">18%</option>
									<option value="28">28%</option>
								</select>
							</div>
							<div class="input_box">
								<label class="lbl">Stock :</label>
								<input type="text" class="tbox" name="txtStock">
							</div>
						</div>
						<div class="row">
							<div class="input_box">
								<label class="lbl">Upload Image</label>
								<input type="file" name="fileImage" class="tbox" onchange="showProductImage()">
							</div>
							<div class="input_box">

							</div>
						</div>
						<input type="submit" name="btnSub" class="btn" value="Submit">
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