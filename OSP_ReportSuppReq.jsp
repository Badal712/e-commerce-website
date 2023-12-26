<%@ page language="java" contentType="text/html" import="java.sql.*" %>
<%!
	Statement stmt;
	Connection conn;
	ResultSet rs;
	int slNo;
	String reqN, dt, supID, supN, phNo, mid, gst, proC, proN, cat, pri, purQ, amo;
	
	public void doConnect(){
		try{
			Class.forName("com.mysql.jdbc.Driver");
		}
		catch(ClassNotFoundException cnfe){
			System.out.println("Unable to load driver"+cnfe);
		}
		
		try{
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ospdb","root","root");
		}
		catch(SQLException se){
			System.out.println("Unable to connect "+se);
		}
	}
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
            <div class="subh">
                <center>
                    <p><span>Nayabazar</span> Cuttack, Odisha</p>
					<h2>Supplier Requisition</h2>
                </center>
            </div>
            <div class="data">
                <table class="table">
                    <thead>
                        <tr>
                            <th>Sl No.</th>
                            <th>Requisition Number</th>
                            <th>Date</th>
                            <th>Supplier ID </th>
                            <th>Supplier Name</th>
                            <th>Phone Number</th>
                            <th>E Mail</th>
                            <th>GSTN</th>
                            <th>Product ID</th>
                            <th>Product Name</th>
                            <th>Category</th>
                            <th>Price</th>
                            <th>Purchase Quantity</th>
                            <th>Amount</th>
                            
                        </tr>
                    </thead>
					<%
						doConnect();
						try{
							stmt = conn.createStatement();
							rs = stmt.executeQuery("select * from osp_tblsuppreg");
							slNo = 1;
							while(rs.next()){
								reqN = rs.getString("Requisition_Number");
								dt = rs.getString("Date");
								supID = rs.getString("Supplier_ID");
								supN = rs.getString("Supplier_Name");
								phNo = rs.getString("Phone_Number");
								mid = rs.getString("e_Mail");
								gst = rs.getString("GST_Number");
								proC = rs.getString("Product_Code");
								proN = rs.getString("Product_Name");
								cat = rs.getString("Category");
								pri = rs.getString("Price");
								purQ = rs.getString("Quantity");
								amo = rs.getString("Amount");
					%>
                    <tbody>
                        <tr>
                            <td><%=slNo%></td>
                            <td><%=reqN%></td>
                            <td><%=dt%></td>
                            <td><%=supID%></td>
                            <td><%=supN%></td>
                            <td><%=phNo%></td>
                            <td><%=mid%></td>
                            <td><%=gst%></td>
                            <td><%=proC%></td>
                            <td><%=proN%></td>
                            <td><%=cat%></td>
                            <td><%=pri%></td>
                            <td><%=purQ%></td>
                            <td><%=amo%></td>
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
