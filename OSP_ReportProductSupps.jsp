<%@ page language="java" contentType="text/html" import= "java.sql.*"%>
<%!
	Statement stmt;
	Connection conn;
	ResultSet rs;
	int slNo;
	String suppN, proC, suppC, proCat, proCC, proN, unit, purP, mrp, taxS, sto, pto, supN;
	
	public void doConnect(){
	
		//Connecting to driver
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
supN = request.getParameter("cmbSuppN");
%>
<html>
	<head>
		<title>Online Shopping Portal</title>
		<script language="javascript">
		   function printme(){
			   window.print();
		   }
		</script>
		<link rel="stylesheet" href="report.css">
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
			<div class="Main">
                <div class="head_logo">
                    <img src="OSS Logo cart.png" class="hlogo" alt="One Stop Shop Logo cart image">
                </div>
                <div class="head">
                    <h2 class="head1">One Stop Shop Mega Mart</h2>
                    <center class="head2">Quality you can trust</center>
                </div>
                <div class="head3">
					<input type="button" value="Print/Save" onclick="printme()" class="btn">
                </div>	
			</div>
            <div>
                <center>
                    <p><span>Nayabazar</span> Cuttack, Odisha</p>
					<p>Product Information [<%=supN%>]</p>
                </center>
            </div>
            <div class="data">
                <table class="table">
                    <thead>
                        <tr>
                            <th>Sl No.</th>
                            <th>Supplier Code</th>
                            <th>Supplier Name</th>
							<th>Product Code</th>
                            <th>Product Category</th>
                            <th>Product Category Code</th>
                            <th>Product Name</th>
                            <th>Unit</th>
                            <th>Purhase Price</th>
                            <th>M.R.P</th>
                            <th>Tax Slab</th>
                            <th>Stock</th>
                            <th>Photo</th>
                        </tr>
                    </thead>
					<%
						doConnect();
						supN = request.getParameter("cmbSuppN");
						try{
							stmt = conn.createStatement();
							rs = stmt.executeQuery("select * from osp_tblproduct where Supplier_Name = '"+supN+"'");
							slNo = 1;
							while(rs.next()){
								proC = rs.getString("Product_Code");
								suppC = rs.getString("Supplier_Code");
								suppN = rs.getString("Supplier_Name");
								proCat = rs.getString("Product_Category");
								proCC = rs.getString("Product_Category_Code");
								proN = rs.getString("Product_Name");
								unit = rs.getString("Unit");
								purP = rs.getString("Purchase_Price");
								mrp = rs.getString("MRP");
								taxS = rs.getString("Tax_Slab");
								sto = rs.getString("Stock");
								pto = rs.getString("Image");
					%>
                    <tbody>
                        <tr>
                            <td><%=slNo%></td>
                            <td><%=suppN%></td>
                            <td><%=suppC%></td>
                            <td><%=proC%></td>
                            <td><%=proCat%></td>
							<td><%=proCC%></td>
                            <td><%=proN%></td>
                            <td><%=unit%></td>
                            <td><%=purP%></td>
                            <td><%=mrp%></td>
                            <td><%=taxS%></td>
                            <td><%=sto%></td>
                            <td><img src="<%=pto%>" width="80" height="60"></td>
                        </tr>
                    </tbody>
					<%
								slNo = slNo+1;
							}
						}
						catch(SQLException se){
							System.out.println("Unable to show "+se);
						}
					%>
                </table>
            </div>
		</section>
		<footer class="footer-distributed">
			<div class="footer-left">
				<img src="OSS Logo cart.png" class="logo logoimg" alt="One Stop Shop Logo cart image">
				<p class="footer-links">
					<a href="#" class="link-1">Home</a>
					<a href="printme()">Print/Save</a>
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