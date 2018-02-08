<?php
/*
 This files contains the sql queries for
 UPDATE AND INSERT only
*/
// Includes
include $_SERVER['DOCUMENT_ROOT'].'/common/commonfunctions.php';
require $_SERVER['DOCUMENT_ROOT'].'/common/dbconnect.php';

// server side vars
session_start();


// variables
$process="";
$data = "";




if(isset($_POST['process'])){
	$process = $_POST['process'];
}
else{
	$postdata = file_get_contents("php://input");
	$request = json_decode($postdata);
	$process = $request->process;
	$data = $request->data;
}

switch($process){
	case "AddOrder":{insertOrder($conn,$data);}break;
	// case "EditOrder":{updateOrder($conn,$data);}break;
	
}

/* function area */
function insertOrder($c,$d){
	$adminId = 1;
	$waiterID = 1;
	$branch = 1;
	$dataInserted = true;
	// print_r($d);

	
	/*
	$sql = $c->prepare("INSERT INTO order_tbl(seat_number,branch_fk,waiter_fk,customer_name,notes,down_payment)VALUES(?,?,?,?,?,?)");
	$sql->bind_param('iiissd',$d->seat_number,$branch,$waiterID,$d->customer_name,$d->notes,$d->down_payment);
	$dataInserted = ($sql->execute() === TRUE) ? true : false;
	if($dataInserted){
		print_r(json_encode(array("id"=>$sql->insert_id)));
	}
	else{
		echo "error";
	}
	$sql->close();
	/**/
	$orderID = 1;
	insertOrderLine($c,$d->orderedItems,$orderID);
}
function updateOrder($c,$d){

}

function insertOrderLine($c,$d){
	print_r($d);
	// foreach ($d as $product) {
		
	// }
}






?>