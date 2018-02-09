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
	$orderID = 0;
	// print_r($d);
	
	$sql = $c->prepare("INSERT INTO order_tbl(seat_number,branch_fk,waiter_fk,customer_name,notes,down_payment)VALUES(?,?,?,?,?,?)");
	$sql->bind_param('siissd',$d->seatID,$branch,$waiterID,$d->customer_name,$d->orderNotes,$d->downPayment);
	$dataInserted = ($sql->execute() === TRUE) ? true : false;
	if($dataInserted){
		insertOrderLine($c,$d->orderedItems,$sql->insert_id);
	}
	else{
		echo "error";//. htmlspecialchars($sql->error);
	}
	$sql->close();
	/**/
	
	
}
function updateOrder($c,$d){

}

function insertOrderLine($c,$d,$orderID){
	$sql = $c->prepare("INSERT INTO order_line_tbl(order_id_fk,product_id_fk,name,code,quantity,price)VALUES(?,?,?,?,?,?)");

	foreach ($d as $product) {
		$sql->bind_param('iissid',$orderID,$product->id,$product->name,$product->productCode,$product->quantity,$product->price);
		$sql->execute();
	}
	// print_r($d);
}






?>