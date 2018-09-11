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
	case "UpdateStocks":{updateStocks($conn,$data);}break;
	case "SetOrderPrinted":{updateOrderPrinted($conn,$data);}break;
	case "SetOrderVoid":{updateOrderVoid($conn,$data);}break;
	case "EditSeatID":{updateSeatID($conn,$data);}break;
	case "OrderReadyToServed":{orderReadyToServed($conn,$data);}break;
}
function orderReadyToServed($c,$d){
	$sql = $c->prepare("UPDATE order_line_tbl SET ready= ? WHERE  id=?");
	$sql->bind_param('ii',$d->status,$d->orderLineId);
	$sql->execute();
}
function updateSeatID($c,$d){
	$sql = $c->prepare("UPDATE order_tbl SET seat_number = ? WHERE id = ?");
	$sql->bind_param('si',$d->selectedOrder->seat_number,$d->selectedOrder->id);
	$msg = ($sql->execute() === TRUE) ? "Order ID $d->id Seat changed" : "Error: " . $sql . "<br>" . $c->error;
	echo $msg;
	$sql->close();
}

function updateOrderVoid($c,$d){
	$empId = $_SESSION["employeeID"];
	$sql = $c->prepare("UPDATE order_tbl SET void_reason=?, void = 1, cashier_fk=? WHERE (SELECT COUNT(order_id_fk) FROM order_line_tbl WHERE order_id_fk = ? AND served_items > 0) = 0 AND id=? AND printed = 0");
	$sql->bind_param('siii',$d->voidReason,$empId,$d->orderID,$d->orderID);
	$msg = "error in mysql";
	if($sql->execute() === TRUE){
		if($sql->affected_rows == 0){
			$msg =  "Cannot void order with served item or printed receipt.";
		}
		else{
			$msg =  "Order ID $d->orderID voided";
		}
	}
	echo $msg;
	$sql->close();
}
function setOrderPaid($c,$d){
	$empId = $_SESSION["employeeID"];
	$sql = $c->prepare("UPDATE order_tbl SET done=1, cashier_fk=? WHERE id = ? AND printed=1");
	$sql->bind_param('ii',$empId,$d->orderID);
	$msg = ($sql->execute() === TRUE) ? "Order ID $d->orderID Paid" : "Error: " . $sql . "<br>" . $c->error;
	$sql->close();
}


function updateOrderPrinted($c,$d){
	// print_r($d);
	$sql = $c->prepare("UPDATE order_tbl SET total_amount = ?, payment=?,discount=?,received_date=NOW(),printed=1,discount_percentage=? WHERE id=?");
	$sql->bind_param('ddddi',$d->totalPrice,$d->payment,$d->discount,$d->discountPercentage,$d->orderID);
	$msg = ($sql->execute() === TRUE) ? "Order ID $d->orderID printed" : "Error: " . $sql . "<br>" . $c->error;
	echo "$msg";
	$sql->close();
	$sql = $c->prepare("UPDATE order_line_tbl SET served_items=quantity WHERE order_id_fk = ?");
	$sql->bind_param('i',$d->orderID);
	$msg = ($sql->execute() === TRUE) ? "Updating data in Order success" : "Error: " . $sql . "<br>" . $c->error;
	$sql->close();
}
function updateStocks($c,$d){
	$sql = $c->prepare("UPDATE product_tbl SET stock=? WHERE id=?");
	$sql->bind_param('ii',$d->stock,$d->prodID);
	$msg = ($sql->execute() === TRUE) ? "Updating data in Product success" : "Error: " . $sql . "<br>" . $c->error;
	$sql->close();
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

function updateOrderServed($c,$d){
	$sql = $c->prepare("UPDATE order_line_tbl SET ready=0, served_items=served_items+1 WHERE id = ? AND served_items<quantity"); 
	$sql->bind_param('i',$d->orderLineID);
	$msg = ($sql->execute() === TRUE) ? "Updating data in orderline success" : "Error: " . $sql . "<br>" . $c->error;
	$sql->close();
}
function removeFromOrderLine($c,$d){
	$sql = $c->prepare("UPDATE order_line_tbl SET ready=0, quantity = quantity-1  WHERE id = ? AND quantity > 0 AND served_items<quantity"); 
	$sql->bind_param('i',$d->orderLineID);
	if($sql->execute() === TRUE){
		$sql = $c->prepare("DELETE FROM `order_line_tbl` WHERE id = ? AND quantity = 0"); 
		$sql->bind_param('i',$d->orderLineID);
		$sql->execute();
	}
	$sql->close();
}
function addToOrderLine($c,$d){
	if(isset($_SESSION["orderID"])){
		$orderID = (int)$_SESSION["orderID"];
		// echo "may orderID orderID: ".$_SESSION["orderID"];
		$sql = $c->prepare("UPDATE order_tbl SET printed=0 WHERE id = ?"); 
		$sql->bind_param('i',$orderID);
		if($sql->execute()){
			insertOrderLine($c,$d->orderedItems,(int)$_SESSION["orderID"]);
		}
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
	
	$sql = $c->prepare("INSERT INTO order_tbl(seat_number,branch_fk,waiter_fk,customer_name,notes,down_payment,vat,service_charge)VALUES(?,?,?,?,?,?,(SELECT percentage FROM pricing_config_tbl WHERE id=1),(SELECT percentage FROM pricing_config_tbl WHERE id=2))");
	$sql->bind_param('siissd',$d->seatID,$branch,$waiterID,$d->customerName,$d->orderNotes,$d->downPayment);
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
		
		if($stmt=$c->prepare("UPDATE product_tbl SET stock=stock-? WHERE id = ? and stock>=?")){
			$stmt->bind_param('iii', $product->quantity,$product->id,$product->quantity);
    		if ($stmt->execute() and $stmt->affected_rows == 1) {
    			$sql->bind_param('iissid',$orderID,$product->id,$product->name,$product->productCode,$product->quantity,$product->price);
				$sql->execute();
    		}
    		else{
    			echo $product->name." ordered quantity is greater than the stock.";
    		}
		}
	}
	$sql->close();
}







?>