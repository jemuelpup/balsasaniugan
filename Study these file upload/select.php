<?php 

/*
this is the database
 --  
 -- Table structure for table `tbl_images`  
 --  
 CREATE TABLE IF NOT EXISTS `tbl_images` (  
  `id` int(11) NOT NULL AUTO_INCREMENT,  
  `name` varchar(255) NOT NULL,  
  PRIMARY KEY (`id`)  
 ) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;  
 --  
 -- Dumping data for table `tbl_images`  
 -- 

*/


 $connect = mysqli_connect("localhost", "root", "", "testing");  
 $output = '';  
 $query = "SELECT * FROM tbl_images ORDER BY id DESC";  
 $result = mysqli_query($connect, $query);  
 while($row = mysqli_fetch_array($result))  
 {  
      $output[] = $row;  
 }  
 echo json_encode($output);  
 ?>  