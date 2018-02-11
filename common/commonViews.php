<?php
/* This file contains the elements for viewing */
function selectCategory($c){
	$sql = "SELECT id,name,category_code,description FROM category_tbl WHERE active=1";
	print_r(hasRows($c,$sql) ? json_encode(selectQuery($c,$sql)) : "");
}
function selectProduct($c){
	$sql = "SELECT id,name,description,picture,product_code,category_fk,price FROM product_tbl";
	print_r(hasRows($c,$sql) ? json_encode(selectQuery($c,$sql)) : "");
}



?>