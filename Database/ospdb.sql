/*
SQLyog Ultimate - MySQL GUI v8.2 
MySQL - 6.0.8-alpha-community : Database - ospdb
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`ospdb` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `ospdb`;

/*Table structure for table `osp_tblcustorder` */

DROP TABLE IF EXISTS `osp_tblcustorder`;

CREATE TABLE `osp_tblcustorder` (
  `Order_Number` char(255) DEFAULT NULL,
  `Order_Date` char(255) DEFAULT NULL,
  `Mobile_Number` char(255) DEFAULT NULL,
  `Password` char(255) DEFAULT NULL,
  `Name` char(255) DEFAULT NULL,
  `Locality` char(255) DEFAULT NULL,
  `City` char(255) DEFAULT NULL,
  `Contant_Number` char(255) DEFAULT NULL,
  `E_Mail` char(255) DEFAULT NULL,
  `Sl_No` char(255) DEFAULT NULL,
  `Product_Code` char(255) DEFAULT NULL,
  `Product_Name` char(255) DEFAULT NULL,
  `Category` char(255) DEFAULT NULL,
  `Price` decimal(11,2) DEFAULT NULL,
  `Order_Quantity` decimal(11,2) DEFAULT NULL,
  `Amount` decimal(11,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `osp_tblcustorder` */

insert  into `osp_tblcustorder`(`Order_Number`,`Order_Date`,`Mobile_Number`,`Password`,`Name`,`Locality`,`City`,`Contant_Number`,`E_Mail`,`Sl_No`,`Product_Code`,`Product_Name`,`Category`,`Price`,`Order_Quantity`,`Amount`) values ('1','2023-10-20','7978295957','Badal1234','Badal Sahoo','Nayabazar','Cuttack','9853493737','od.badal07@gmail.com','1',' D569937WIN9','DELL Alienware Core i5 12500H 12th Gen','Laptop','145990.00','1.00','145990.00'),('2','2023-10-22','7978295957','Badal1234','Badal Sahoo','Nayabazar','Cuttack','9853493737','od.badal07@gmail.com','2',' D569937WIN9','DELL Alienware Core i5 12500H 12th Gen','Laptop','145990.00','2.00','291980.00');

/*Table structure for table `osp_tblissuetocust` */

DROP TABLE IF EXISTS `osp_tblissuetocust`;

CREATE TABLE `osp_tblissuetocust` (
  `Invoice_Number` char(255) DEFAULT NULL,
  `Invoice_Date` char(255) DEFAULT NULL,
  `Order_Number` char(255) DEFAULT NULL,
  `Order_Date` char(255) DEFAULT NULL,
  `Customer_Number` char(255) DEFAULT NULL,
  `Customer_Name` char(255) DEFAULT NULL,
  `Locality` char(255) DEFAULT NULL,
  `City` char(255) DEFAULT NULL,
  `Contact_Number` char(255) DEFAULT NULL,
  `E_Mail` char(255) DEFAULT NULL,
  `GST_Number` char(255) DEFAULT NULL,
  `Invoice_Type` char(255) DEFAULT NULL,
  `Sl_No` char(255) DEFAULT NULL,
  `Product_ID` char(255) DEFAULT NULL,
  `Product_Name` char(255) DEFAULT NULL,
  `Category` char(255) DEFAULT NULL,
  `Price` decimal(11,2) DEFAULT NULL,
  `Issue_Quantity` decimal(11,2) DEFAULT NULL,
  `Amount` decimal(11,2) DEFAULT NULL,
  `Discount_P` decimal(11,2) DEFAULT NULL,
  `Discount_Amount` decimal(11,2) DEFAULT NULL,
  `GST_P` decimal(11,2) DEFAULT NULL,
  `GST_Amount` decimal(11,2) DEFAULT NULL,
  `Net_Amount` decimal(11,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `osp_tblissuetocust` */

insert  into `osp_tblissuetocust`(`Invoice_Number`,`Invoice_Date`,`Order_Number`,`Order_Date`,`Customer_Number`,`Customer_Name`,`Locality`,`City`,`Contact_Number`,`E_Mail`,`GST_Number`,`Invoice_Type`,`Sl_No`,`Product_ID`,`Product_Name`,`Category`,`Price`,`Issue_Quantity`,`Amount`,`Discount_P`,`Discount_Amount`,`GST_P`,`GST_Amount`,`Net_Amount`) values ('2564535','2023-10-26','1','2023-10-20','7978295957','7978295957','Nayabazar','Cuttack','9853493737','od.badal07@gmail.com','N/A','CREDIT','1','456892','Red Bull Energy Drink','Energy Drink','100.00','6.00','600.00','10.00','60.00','12.00','64.80','604.80'),('2564536','2023-10-26','2','2023-10-22','7978295957','7978295957','Nayabazar','Cuttack','9853493737','od.badal07@gmail.com','N/A','CREDIT','2',' D569937WIN9','DELL Alienware Core i5 12500H 12th Gen','Laptop','199990.00','2.00','399980.00','10.00','39998.00','12.00','43197.84','403179.84'),('3594712','2023-10-28','2','2023-10-22','7978295957','7978295957','Nayabazar','Cuttack','9853493737','od.badal07@gmail.com','N/A','CASH','1',' 9000016330','Parker-Classic gold Trim Ball Point Pen','Pen','20.00','4.00','80.00','5.00','4.00','8.00','6.08','82.08');

/*Table structure for table `osp_tblissuetoret` */

DROP TABLE IF EXISTS `osp_tblissuetoret`;

CREATE TABLE `osp_tblissuetoret` (
  `Invoice_Number` char(255) DEFAULT NULL,
  `Invoice_Date` char(255) DEFAULT NULL,
  `Requisition_Number` char(255) DEFAULT NULL,
  `Requisition_Date` char(255) DEFAULT NULL,
  `Retailer_Name` char(255) DEFAULT NULL,
  `Retailer_ID` char(255) DEFAULT NULL,
  `Locality` char(255) DEFAULT NULL,
  `city` char(255) DEFAULT NULL,
  `Phone_Number` char(255) DEFAULT NULL,
  `E_Mail` char(255) DEFAULT NULL,
  `GST_Number` char(255) DEFAULT NULL,
  `Invoice_Type` char(255) DEFAULT NULL,
  `Sl_No` int(255) DEFAULT NULL,
  `Product_ID` char(255) DEFAULT NULL,
  `Product_Name` char(255) DEFAULT NULL,
  `Category` char(255) DEFAULT NULL,
  `Price` decimal(11,2) DEFAULT NULL,
  `Issue_Quantity` decimal(11,2) DEFAULT NULL,
  `Amount` decimal(11,2) DEFAULT NULL,
  `Discount_P` decimal(11,2) DEFAULT NULL,
  `Discount_Amount` decimal(11,2) DEFAULT NULL,
  `GST_P` decimal(11,2) DEFAULT NULL,
  `GST_Amount` decimal(11,2) DEFAULT NULL,
  `Net_Amount` decimal(11,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `osp_tblissuetoret` */

insert  into `osp_tblissuetoret`(`Invoice_Number`,`Invoice_Date`,`Requisition_Number`,`Requisition_Date`,`Retailer_Name`,`Retailer_ID`,`Locality`,`city`,`Phone_Number`,`E_Mail`,`GST_Number`,`Invoice_Type`,`Sl_No`,`Product_ID`,`Product_Name`,`Category`,`Price`,`Issue_Quantity`,`Amount`,`Discount_P`,`Discount_Amount`,`GST_P`,`GST_Amount`,`Net_Amount`) values ('2564685','2023-10-19','2','2023-10-05','Manoj Kumar Nayak','Manoj@2004','Madhupatana','Cuttack','8754213698','manojkumar255@gmail.com','KOED1234EFG88','CASH',1,'456892','Red Bull Energy Drink','Energy Drink','95.00','100.00','9500.00','5.00','475.00','12.00','1083.00','10108.00'),('2564535','2023-10-26','null','null','null','null','Nayabazar','Cuttack','null','od.badal07@gmail.com','N/A','CASH',1,' D569937WIN9','DELL Alienware Core i5 12500H 12th Gen','Laptop','199990.00','1.00','199990.00','10.00','19999.00','12.00','21598.92','201589.92'),('2564536','2023-10-26','null','null','null','null','Nayabazar','Cuttack','null','od.badal07@gmail.com','N/A','CASH',1,' D569937WIN9','DELL Alienware Core i5 12500H 12th Gen','Laptop','199990.00','1.00','199990.00','10.00','19999.00','12.00','21598.92','201589.92'),('2564536','2023-10-26','null','null','null','null','Nayabazar','Cuttack','null','od.badal07@gmail.com','N/A','CASH',1,' D569937WIN9','DELL Alienware Core i5 12500H 12th Gen','Laptop','199990.00','1.00','199990.00','12.00','23998.80','12.00','21119.04','197111.04');

/*Table structure for table `osp_tblpayment` */

DROP TABLE IF EXISTS `osp_tblpayment`;

CREATE TABLE `osp_tblpayment` (
  `Voucher_Number` char(255) DEFAULT NULL,
  `Voucher_Date` char(255) DEFAULT NULL,
  `Supplier_ID` char(255) DEFAULT NULL,
  `Supplier_Name` char(255) DEFAULT NULL,
  `Phone_Number` char(255) DEFAULT NULL,
  `E_Mail` char(255) DEFAULT NULL,
  `GST_Number` char(255) DEFAULT NULL,
  `Payment_Mode` char(255) DEFAULT NULL,
  `Refernce_Number` char(255) DEFAULT NULL,
  `Date` char(255) DEFAULT NULL,
  `Bank_Name` char(255) DEFAULT NULL,
  `Amount` decimal(11,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `osp_tblpayment` */

insert  into `osp_tblpayment`(`Voucher_Number`,`Voucher_Date`,`Supplier_ID`,`Supplier_Name`,`Phone_Number`,`E_Mail`,`GST_Number`,`Payment_Mode`,`Refernce_Number`,`Date`,`Bank_Name`,`Amount`) values ('1','2023-10-29','Badal@1997','Badal Sahoo','7978295957','od.badal07@gmail.com','25ANDS35632SD','CHEQUE','0000202317','2023-10-12','Union Bank of India','45000.00'),('2','2023-10-29','Kumar1234','Ramesh Kumar','9861830389','rameshkumar78@gmail.com','ABCD1234EFG45','ONLINE','0000202318','2023-10-09','State Bank of India','15000.00'),('3','2023-10-29','Nandan@1234','Nandan Kumar','7894561233','nandan26@gmail.com','SAKC5456CAC45','CASH','0000202319','2023-10-05','Yes Bank Ltd','12750.00'),('4','2023-10-29','Rajiv@1234','Rajiv Ranjan Swain','4844545698','nvjkdsvn@gmail.com','HFSBVJBJ4645','DRAFT','0000202320','2023-09-25','Canara Bank','25000.00');

/*Table structure for table `osp_tblprodcat` */

DROP TABLE IF EXISTS `osp_tblprodcat`;

CREATE TABLE `osp_tblprodcat` (
  `Product_Category_Code` char(30) DEFAULT NULL,
  `Product_Category_Name` char(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `osp_tblprodcat` */

insert  into `osp_tblprodcat`(`Product_Category_Code`,`Product_Category_Name`) values ('ABCD12','Mobile'),('CDEF34','Pen'),('EFGH45','Bodycare'),('ADHK85','Energy Drink'),('GHJK56','Hand loom'),('AKHJ85','Laptop');

/*Table structure for table `osp_tblproduct` */

DROP TABLE IF EXISTS `osp_tblproduct`;

CREATE TABLE `osp_tblproduct` (
  `Supplier_Name` varchar(255) DEFAULT NULL,
  `Supplier_Code` varchar(255) DEFAULT NULL,
  `Product_Category` varchar(255) DEFAULT NULL,
  `Product_Category_Code` varchar(255) DEFAULT NULL,
  `Product_Code` varchar(255) DEFAULT NULL,
  `Product_Name` varchar(255) DEFAULT NULL,
  `Unit` varchar(255) DEFAULT NULL,
  `Purchase_Price` decimal(11,2) DEFAULT NULL,
  `MRP` decimal(11,2) DEFAULT NULL,
  `Tax_Slab` decimal(11,2) DEFAULT NULL,
  `Stock` decimal(11,2) DEFAULT NULL,
  `Image` char(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `osp_tblproduct` */

insert  into `osp_tblproduct`(`Supplier_Name`,`Supplier_Code`,`Product_Category`,`Product_Category_Code`,`Product_Code`,`Product_Name`,`Unit`,`Purchase_Price`,`MRP`,`Tax_Slab`,`Stock`,`Image`) values ('Biswa Ranjan Panda','BrPanda@1234','Energy Drink','78956256','456892','Red Bull Energy Drink','250ml','95.00','100.00','12.00','1190.00','Red Bull Energy Drink.jpg'),('Suman Na','Suman@1985','Laptop','7885223',' D569937WIN9','DELL Alienware Core i5 12500H 12th Gen','nos','145990.00','199990.00','12.00','47.00','Dell.jpg'),('Badal Sahoo','Badal@1997','Pen','CDEF34',' 9000016330','Parker-Classic gold Trim Ball Point Pen','nos','15.00','20.00','8.00','151.00','Parker Pen.jpg');

/*Table structure for table `osp_tblreceiptvou` */

DROP TABLE IF EXISTS `osp_tblreceiptvou`;

CREATE TABLE `osp_tblreceiptvou` (
  `Voucher_Number` char(255) DEFAULT NULL,
  `Voucher_Date` char(255) DEFAULT NULL,
  `Retailer_Name` char(255) DEFAULT NULL,
  `Retailer_ID` char(255) DEFAULT NULL,
  `Phone_Number` char(255) DEFAULT NULL,
  `E_Mail` char(255) DEFAULT NULL,
  `GST_Number` char(255) DEFAULT NULL,
  `Payment_Mode` char(255) DEFAULT NULL,
  `Refernce_Number` char(255) DEFAULT NULL,
  `Date` char(255) DEFAULT NULL,
  `Bank_Name` char(255) DEFAULT NULL,
  `Amount` decimal(11,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `osp_tblreceiptvou` */

insert  into `osp_tblreceiptvou`(`Voucher_Number`,`Voucher_Date`,`Retailer_Name`,`Retailer_ID`,`Phone_Number`,`E_Mail`,`GST_Number`,`Payment_Mode`,`Refernce_Number`,`Date`,`Bank_Name`,`Amount`) values ('1','2023-10-29','Manoj Kumar Nayak','Manoj Kumar Nayak','8754213698','manojkumar255@gmail.com','KOED1234EFG88','CHEQUE','0000112580','2023-10-02','Union Bank of India','15000.00'),('2','2023-10-30','Badal Sahoo','Badal Sahoo','9853493737','od.badal07@gmail.com','SAKC5456CAC45','DRAFT','0000112581','2023-10-14','Punjab National Bank','199990.00'),('3','2023-10-17','Satya Ram Ray','Satya Ram Ray','9861885522','satya.ram1995@gmail.com','KLKC5456CDB25','ONLINE','0000112582','2023-10-09','State Bank of India','11375.00');

/*Table structure for table `osp_tblrecgood` */

DROP TABLE IF EXISTS `osp_tblrecgood`;

CREATE TABLE `osp_tblrecgood` (
  `Invoice_Number` char(255) DEFAULT NULL,
  `Invoice_Date` char(255) DEFAULT NULL,
  `Requisition_Number` char(255) DEFAULT NULL,
  `Requisition_Date` char(255) DEFAULT NULL,
  `Supplier_Name` char(255) DEFAULT NULL,
  `Supplier_ID` char(255) DEFAULT NULL,
  `Locality` char(255) DEFAULT NULL,
  `City` char(255) DEFAULT NULL,
  `Phone_Number` char(255) DEFAULT NULL,
  `e_Mail` char(255) DEFAULT NULL,
  `GST_Number` char(255) DEFAULT NULL,
  `Invoice_Type` char(255) DEFAULT NULL,
  `Sl_No` char(255) DEFAULT NULL,
  `Product_ID` char(255) DEFAULT NULL,
  `Product_Name` char(255) DEFAULT NULL,
  `Category` char(255) DEFAULT NULL,
  `Price` decimal(11,2) DEFAULT NULL,
  `Purchase_Quantity` decimal(11,2) DEFAULT NULL,
  `Amount` decimal(11,2) DEFAULT NULL,
  `Discount_P` decimal(11,2) DEFAULT NULL,
  `Discount_Amount` decimal(11,2) DEFAULT NULL,
  `GST_P` decimal(11,2) DEFAULT NULL,
  `GST_Amount` decimal(11,2) DEFAULT NULL,
  `Net_Amount` decimal(11,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `osp_tblrecgood` */

insert  into `osp_tblrecgood`(`Invoice_Number`,`Invoice_Date`,`Requisition_Number`,`Requisition_Date`,`Supplier_Name`,`Supplier_ID`,`Locality`,`City`,`Phone_Number`,`e_Mail`,`GST_Number`,`Invoice_Type`,`Sl_No`,`Product_ID`,`Product_Name`,`Category`,`Price`,`Purchase_Quantity`,`Amount`,`Discount_P`,`Discount_Amount`,`GST_P`,`GST_Amount`,`Net_Amount`) values ('1587698','2023-09-27','256/27/DRM/23','2023-09-24','Rajiv Ranjan Swain','Rajiv@1234','Mysuru','Chhattisgarh','4844545698','nvjkdsvn@gmail.com','HFSBVJBJ4645','CREDIT','1','456892','Red Bull Energy Drink','Energy Drink','95.00','30.00','2850.00','10.00','285.00','12.00','307.80','2872.80'),('2589856','2023-09-28','896/86/LMD/23','2011-02-25','Suman@1985','Suman@1985','Brindavan Complex, Chirag Ali Lane','Hyderabad','8564256254','suman2008@gmail.com','FGHB8524EFG96','CASH','2',' 9000016330','Parker-Classic gold Trim Ball Point Pen','Pen','15.00','500.00','7500.00','12.00','900.00','18.00','1350.00','7950.00'),('2564798','2023-09-28','876/45/POL/23','2023-09-13','Badal@1997','Badal@1997','Nayabazar','Cuttack','7978295957','od.badal07@gmail.com','25ANDS35632SD','CREDIT','1',' D569937WIN9','DELL Alienware Core i5 12500H 12th Gen','Laptop2','145990.00','30.00','4379700.00','10.00','437970.00','18.00','709511.40','4651241.40'),('2564798','2023-09-28','876/45/POL/23','2023-09-13','Badal@1997','Badal@1997','Nayabazar','Cuttack','7978295957','od.badal07@gmail.com','25ANDS35632SD','CREDIT','1',' D569937WIN9','DELL Alienware Core i5 12500H 12th Gen','Laptop2','145990.00','30.00','4379700.00','10.00','437970.00','18.00','709511.40','4651241.40');

/*Table structure for table `osp_tblretailer` */

DROP TABLE IF EXISTS `osp_tblretailer`;

CREATE TABLE `osp_tblretailer` (
  `Retailer_ID` char(255) DEFAULT NULL,
  `Retailer_Name` char(255) DEFAULT NULL,
  `Contact_Person` char(255) DEFAULT NULL,
  `Locality` char(255) DEFAULT NULL,
  `City` char(255) DEFAULT NULL,
  `State` char(255) DEFAULT NULL,
  `Phone_Number` char(255) DEFAULT NULL,
  `e_Mail` char(255) DEFAULT NULL,
  `GST_Number` char(255) DEFAULT NULL,
  `GST_Date` char(255) DEFAULT NULL,
  `Password` char(255) DEFAULT NULL,
  `Confirm_Password` char(255) DEFAULT NULL,
  `Photo` char(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `osp_tblretailer` */

insert  into `osp_tblretailer`(`Retailer_ID`,`Retailer_Name`,`Contact_Person`,`Locality`,`City`,`State`,`Phone_Number`,`e_Mail`,`GST_Number`,`GST_Date`,`Password`,`Confirm_Password`,`Photo`) values ('Kumar@1998','Rajiv Kumar','Badal Sahoo','Anna Nagar','Cuttack','Odisha','null','od.badal07@gmail.com','KJDD1234EFG45','2023-09-07','Kumar1234','kumar315','Rajiv Kumar Passport.jpg'),('Badal@1998','Badal Sahoo','Rajiv Kumar','Rajendra Nagar','Cuttack','Odisha','9853493737','od.badal07@gmail.com','SAKC5456CAC45','1998-03-05','kumar9874','Kumar4789','Parker Pen.jpg'),('Bk98876','Satya Ram Ray','Sudarsan Rout','Khandagiri','Bhubaneswar','Odisha','9861885522','satya.ram1995@gmail.com','KLKC5456CDB25','2023-09-12','Satya@1995','Satya@1998','Satya Ram Passport.jpg'),('Manoj@2004','Manoj Kumar Nayak','Sunjib Patra','Madhupatana','Cuttack','Odisha','8754213698','manojkumar255@gmail.com','KOED1234EFG88','2020-02-13','Manoj#2005','Manoj#2005','Manoj Kumar.jpg'),('Rajiv@2000','Rajiv Ranjan Swain','Sai Priya Samanta','Ramnagar','Delhi','Delhi','7895412365','rajivranjan2000@gmail.com','QOPC5996DKC89','2021-02-17','Rajiv@1234','ManojKumar1234','Rajiv Ranjan Swain.jpg'),('Suraj@1985','Suraj Chandra Ray','Dhananjaya Ray','Badachana','Jajpur','Odisha','8561793146','surajch2005@outlook.com','DTKC5456CAC86','2001-03-25','Suraj@1234','Suraj@1234','Suraj.jpg'),('null','null','null','null','null','null','null','null','null','null','null','null','null');

/*Table structure for table `osp_tblretreq` */

DROP TABLE IF EXISTS `osp_tblretreq`;

CREATE TABLE `osp_tblretreq` (
  `Requisition_Number` char(255) DEFAULT NULL,
  `Date` char(255) DEFAULT NULL,
  `Retailer_ID` char(255) DEFAULT NULL,
  `Password` char(255) DEFAULT NULL,
  `Retailer_Name` char(255) DEFAULT NULL,
  `Locality` char(255) DEFAULT NULL,
  `City` char(255) DEFAULT NULL,
  `Phone_Number` char(255) DEFAULT NULL,
  `E_Mail` char(255) DEFAULT NULL,
  `GST_Number` char(255) DEFAULT NULL,
  `Sl_No` char(255) DEFAULT NULL,
  `Product_Code` char(255) DEFAULT NULL,
  `Product_Name` char(255) DEFAULT NULL,
  `Category` char(255) DEFAULT NULL,
  `Price` decimal(11,2) DEFAULT NULL,
  `Quentity` decimal(11,2) DEFAULT NULL,
  `Amount` decimal(11,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `osp_tblretreq` */

insert  into `osp_tblretreq`(`Requisition_Number`,`Date`,`Retailer_ID`,`Password`,`Retailer_Name`,`Locality`,`City`,`Phone_Number`,`E_Mail`,`GST_Number`,`Sl_No`,`Product_Code`,`Product_Name`,`Category`,`Price`,`Quentity`,`Amount`) values ('1','2023-10-12','Kumar@1998','Kumar1234',NULL,'Anna Nagar','Cuttack','7978295957','od.badal07@gmail.com','KJDD1234EFG45','1',' 9000016330','Parker-Classic gold Trim Ball Point Pen','Pen','20.00','15.00','300.00'),('2','2023-10-05','Manoj@2004','',NULL,'Madhupatana','Cuttack','8754213698','manojkumar255@gmail.com','KOED1234EFG88','1',' D569937WIN9','DELL Alienware Core i5 12500H 12th Gen','Laptop','199990.00','2.00','399980.00'),('2','2023-10-05','Manoj@2004','','Manoj Kumar Nayak','Madhupatana','Cuttack','8754213698','manojkumar255@gmail.com','KOED1234EFG88','1',' D569937WIN9','DELL Alienware Core i5 12500H 12th Gen','Laptop','199990.00','2.00','399980.00'),('4','2023-10-17','Rajiv@2000','Rajiv@1234','Rajiv Ranjan Swain','Ramnagar','Delhi','7895412365','rajivranjan2000@gmail.com','QOPC5996DKC89','1',' D569937WIN9','DELL Alienware Core i5 12500H 12th Gen','Laptop','199990.00','2.00','399980.00');

/*Table structure for table `osp_tblsuppreg` */

DROP TABLE IF EXISTS `osp_tblsuppreg`;

CREATE TABLE `osp_tblsuppreg` (
  `Requisition_Number` char(255) DEFAULT NULL,
  `Supplier_Name` char(255) DEFAULT NULL,
  `Date` char(255) DEFAULT NULL,
  `Locality` char(255) DEFAULT NULL,
  `Supplier_ID` char(255) DEFAULT NULL,
  `Phone_Number` char(255) DEFAULT NULL,
  `City` char(255) DEFAULT NULL,
  `GST_Number` char(255) DEFAULT NULL,
  `e_Mail` char(255) DEFAULT NULL,
  `SlNo` char(255) DEFAULT NULL,
  `Product_Code` char(255) DEFAULT NULL,
  `Product_Name` char(255) DEFAULT NULL,
  `Category` char(255) DEFAULT NULL,
  `Price` decimal(11,2) DEFAULT NULL,
  `Quantity` decimal(11,2) DEFAULT NULL,
  `Amount` decimal(11,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `osp_tblsuppreg` */

insert  into `osp_tblsuppreg`(`Requisition_Number`,`Supplier_Name`,`Date`,`Locality`,`Supplier_ID`,`Phone_Number`,`City`,`GST_Number`,`e_Mail`,`SlNo`,`Product_Code`,`Product_Name`,`Category`,`Price`,`Quantity`,`Amount`) values ('876/45/POL/23','Badal@1997','2023-09-13','Nayabazar','Badal@1997','7978295957','Cuttack','25ANDS35632SD','od.badal07@gmail.com','1',' D569937WIN9','DELL Alienware Core i5 12500H 12th Gen','Laptop','145990.00','18.00','2627820.00'),('896/86/LMD/23','Suman@1985','2011-02-25','Brindavan Complex, Chirag Ali Lane','Suman@1985','8564256254','Hyderabad','FGHB8524EFG96','suman2008@gmail.com','1',' D569937WIN9','DELL Alienware Core i5 12500H 12th Gen','Laptop','145990.00','20.00','2919800.00'),('256/27/DRM/23','Rajiv Ranjan Swain','2023-09-24','Mysuru','Rajiv@1234','4844545698','Chhattisgarh','HFSBVJBJ4645','nvjkdsvn@gmail.com','1','456892','Red Bull Energy Drink','Energy Drink','95.00','50.00','4750.00'),('256/27/DRM/23','Rajiv Ranjan Swain','2023-09-24','Mysuru','Rajiv@1234','4844545698','Chhattisgarh','HFSBVJBJ4645','nvjkdsvn@gmail.com','2',' D569937WIN9','DELL Alienware Core i5 12500H 12th Gen','Laptop','145990.00','15.00','2189850.00'),('256/27/DRM/23','Rajiv Ranjan Swain','2023-09-24','Mysuru','Rajiv@1234','4844545698','Chhattisgarh','HFSBVJBJ4645','nvjkdsvn@gmail.com','3',' 9000016330','Parker-Classic gold Trim Ball Point Pen','Pen','15.00','800.00','12000.00');

/*Table structure for table `tblorgn` */

DROP TABLE IF EXISTS `tblorgn`;

CREATE TABLE `tblorgn` (
  `Registration_Number` varchar(20) DEFAULT NULL,
  `DATE` char(15) DEFAULT NULL,
  `Organization_Name` char(100) DEFAULT NULL,
  `Head_of_Organization` char(100) DEFAULT NULL,
  `Locality` char(50) DEFAULT NULL,
  `City` char(50) DEFAULT NULL,
  `State` char(50) DEFAULT NULL,
  `Phone_Number` char(15) DEFAULT NULL,
  `e_Mail` char(50) DEFAULT NULL,
  `GST_Number` char(30) DEFAULT NULL,
  `GST_Date` char(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tblorgn` */

insert  into `tblorgn`(`Registration_Number`,`DATE`,`Organization_Name`,`Head_of_Organization`,`Locality`,`City`,`State`,`Phone_Number`,`e_Mail`,`GST_Number`,`GST_Date`) values ('EF4321GH3693','2015-12-07','One Stop Shop Mega Mart','Badal Sahoo','Nayabazar','Cuttack','Odisha','7978295957','od.badal07@gmail.com','98AKCDS0230A1Z9','2018-02-15');

/*Table structure for table `tblsup` */

DROP TABLE IF EXISTS `tblsup`;

CREATE TABLE `tblsup` (
  `Supplier_ID` char(15) DEFAULT NULL,
  `Supplier_Name` char(50) DEFAULT NULL,
  `Contact_Person` char(50) DEFAULT NULL,
  `Locality` char(50) DEFAULT NULL,
  `City` char(50) DEFAULT NULL,
  `State` char(50) DEFAULT NULL,
  `Phone_Number` char(20) DEFAULT NULL,
  `e_Mail` char(50) DEFAULT NULL,
  `GST_Number` char(30) DEFAULT NULL,
  `GST_Date` char(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tblsup` */

insert  into `tblsup`(`Supplier_ID`,`Supplier_Name`,`Contact_Person`,`Locality`,`City`,`State`,`Phone_Number`,`e_Mail`,`GST_Number`,`GST_Date`) values ('Badal@1997','Badal Sahoo','Rajib Lochan Parhi','Nayabazar','Cuttack','Odisha','7978295957','od.badal07@gmail.com','25ANDS35632SD','17-12-1985'),('Kumar1234','Ramesh Kumar','9861830389','Gopapur','Mathura','Uttar Pradesh','9861830389','rameshkumar78@gmail.com','ABCD1234EFG45','2003-08-25'),('Nandan@1234','Nandan Kumar','Ashoak Kumar','Pkauli','Patna','Bihar','7894561233','nandan26@gmail.com','SAKC5456CAC45','51997-02-25'),('Rajiv@1234','Rajiv Ranjan Swain','Biswa Das','Mysuru','Chhattisgarh','Chhattisgarh','4844545698','nvjkdsvn@gmail.com','HFSBVJBJ4645','1990-10-30'),('Suman@1985','Suman Na','Ramesh Yadav','Brindavan Complex, Chirag Ali Lane','Hyderabad','Andhra Pradesh','8564256254','suman2008@gmail.com','FGHB8524EFG96','2018-08-25');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
