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

switch($process){
	case "GetEmployee":{selectEmployee($conn);}break;
}


// selectEmployee($conn);
function selectEmployee($c){
	$sql = "SELECT id,name,picture,address,contact_number,email,position_fk,branch_fk,salary,modified_by_fk,birth_day,gender FROM employee_tbl";
	print_r(hasRows($c,$sql) ? json_encode(selectQuery($c,$sql)) : "");
	// print_r(hasRows($c,$sql) ? json_encode(selectQuery($c,$sql)) : "");
}


/*/ This function needs some edit
function selectFunctionNameWCond($c,$d){
	$sql = "SELECT id,name,category_code,description FROM category_tbl WHERE active = 1 and name = $d->name";// add security here
	print_r(hasRows($c,$sql) ? json_encode(selectQuery($c,$sql)) : "");
}
/**/


?>