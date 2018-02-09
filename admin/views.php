<?php
/* This file contains the elements for viewing */

include $_SERVER['DOCUMENT_ROOT'].'/common/commonfunctions.php';
require $_SERVER['DOCUMENT_ROOT'].'/common/dbconnect.php';

$process="";

if(isset($_POST['process'])){
	$process = $_POST['process'];
}
else{
	$postdata = file_get_contents("php://input");
	$request = json_decode($postdata);
	$process = $request->process;
	$d = $request->data;
}
// $process = "GetCategory";
switch($process){
	case "GetEmployee":{selectEmployee($conn);}break;
	case "GetPosition":{selectPosition($conn);}break;
	case "GetBranch":{selectBranch($conn);}break;
	case "GetCategory":{selectCategory($conn);}break;
	case "GetProduct":{selectProduct($conn);}break;
}

// selectEmployee($conn);
function selectEmployee($c){
	$sql = "SELECT id,name,picture,address,contact_number,email,position_fk,(SELECT name FROM position_tbl WHERE id=position_fk) as position_name,branch_fk,(SELECT name FROM branch_tbl WHERE id = branch_fk) as branch_name,salary,modified_by_fk,birth_day,gender FROM employee_tbl WHERE active=1";
	print_r(hasRows($c,$sql) ? json_encode(selectQuery($c,$sql)) : "");
}

function selectPosition($c){
	$sql = "SELECT id,name,description FROM position_tbl WHERE active=1";
	print_r(hasRows($c,$sql) ? json_encode(selectQuery($c,$sql)) : "");
}
function selectBranch($c){
	$sql = "SELECT id,name,address,description,branch_code FROM branch_tbl WHERE active=1";
	print_r(hasRows($c,$sql) ? json_encode(selectQuery($c,$sql)) : "");
}
function selectCategory($c){
	$sql = "SELECT id,name,category_code,description FROM category_tbl WHERE active=1";
	print_r(hasRows($c,$sql) ? json_encode(selectQuery($c,$sql)) : "");
}
function selectProduct($c){
	$sql = "SELECT id,name,description,picture,product_code,category_fk,price FROM product_tbl";
	print_r(hasRows($c,$sql) ? json_encode(selectQuery($c,$sql)) : "");
}

/*/ This function needs some edit
function selectFunctionNameWCond($c,$d){
	$sql = "SELECT id,name,category_code,description FROM category_tbl WHERE active = 1 and name = $d->name";// add security here
	print_r(hasRows($c,$sql) ? json_encode(selectQuery($c,$sql)) : "");
}
/**/


?>