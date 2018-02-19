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
	case "SetOrderID":{setOrderID($data);}break;
	case "GetOrderID":{getOrderID($data);}break;
	case "AddOrderLine":{addToOrderLine($conn,$data);}break;
	case "RemoveFromOrderLine":{removeFromOrderLine($conn,$data);}break;
	case "ServeOrder":{updateOrderServed($conn,$data);}break;
	case "SetOrderPaid":{setOrderPaid($conn,$data);}break;
	case "SetProductAvailable":{updateProductAvailable($conn,$data);}break;
	case "SetProductNotAvailable":{updateProductNotAvailable($conn,$data);}break;
}
function updateProductAvailable($c,$d){
	$sql = $c->prepare("UPDATE product_tbl SET available=1 WHERE id=?");
	$sql->bind_param('i',$d->prodID);
	$msg = ($sql->execute() === TRUE) ? "Updating data in Product success" : "Error: " . $sql . "<br>" . $c->error;
	$sql->close();
}
function updateProductNotAvailable($c,$d){
	$sql = $c->prepare("UPDATE product_tbl SET available=0 WHERE id=?");
	$sql->bind_param('i',$d->prodID);
	$msg = ($sql->execute() === TRUE) ? "Updating data in Product success" : "Error: " . $sql . "<br>" . $c->error;
	$sql->close();
}
function setOrderPaid($c,$d){
	$sql = $c->prepare("UPDATE order_tbl SET payment=?,discount=?,received_date=NOW() WHERE id = ?"); 
	$sql->bind_param('ddi',$d->totalPrice,$d->discount,$d->orderID);
	$msg = ($sql->execute() === TRUE) ? "Updating data in Order success" : "Error: " . $sql . "<br>" . $c->error;
	$sql->close();
	$sql = $c->prepare("UPDATE order_line_tbl SET served_items=quantity WHERE order_id_fk = ?");
	$sql->bind_param('i',$d->orderID);
	$msg = ($sql->execute() === TRUE) ? "Updating data in Order success" : "Error: " . $sql . "<br>" . $c->error;
	$sql->close();
	/**/
}
function updateOrderServed($c,$d){
	$sql = $c->prepare("UPDATE order_line_tbl SET served_items=served_items+1 WHERE id = ?"); 
	$sql->bind_param('i',$d->orderLineID);
	$msg = ($sql->execute() === TRUE) ? "Updating data in orderline success" : "Error: " . $sql . "<br>" . $c->error;
	$sql->close();
}
function removeFromOrderLine($c,$d){
	$sql = $c->prepare("DELETE FROM `order_line_tbl` WHERE id = ?"); 
	$sql->bind_param('i',$d->orderLineID);
	$msg = ($sql->execute() === TRUE) ? "Removing data to orderline success" : "Error: " . $sql . "<br>" . $c->error;
	$sql->close();
}
function addToOrderLine($c,$d){
	if(isset($_SESSION["orderID"])){
		// echo "may orderID orderID: ".$_SESSION["orderID"];
		insertOrderLine($c,$d->orderedItems,(int)$_SESSION["orderID"]);
	}
	else{
		// echo "walang orderID";
	}
}
function setOrderID($d){
	print_r($d);
	$_SESSION["orderID"] = $d->orderID;
}
function getOrderID(){
	$orderID = 0;
	if(isset($_SESSION["orderID"])){
		$orderID = $_SESSION["orderID"];
	}
	print_r(json_encode(array("orderID"=>$orderID)));
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

function insertOrderLine($c,$d,$orderID){
	$sql = $c->prepare("INSERT INTO order_line_tbl(order_id_fk,product_id_fk,name,code,quantity,price)
		VALUES(?,?,?,?,?,?)");
	
	foreach ($d as $product) {
		// echo "dumaan dito";
		// print_r($product);
		$sql->bind_param('iissid',$orderID,$product->id,$product->name,$product->productCode,$product->quantity,$product->price);
		$sql->execute();
	}
	$sql->close();
}







?>