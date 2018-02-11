<?php
/* This file contains the elements for viewing */

include $_SERVER['DOCUMENT_ROOT'].'/common/commonfunctions.php';
require $_SERVER['DOCUMENT_ROOT'].'/common/dbconnect.php';
require $_SERVER['DOCUMENT_ROOT'].'/common/commonViews.php';

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
	case "GetOrders":{selectOrders($conn);}break;
	case "GetCategory":{selectCategory($conn);}break;
	case "GetProduct":{selectProduct($conn);}break;
}

// selectEmployee($conn);
function selectOrders($c){
	$sql = "SELECT o.id as order_id,o.order_date as order_date,o.seat_number as order_seat_number,o.cashier_fk as order_cashier_fk,o.branch_fk as order_branch_fk,o.waiter_fk as order_waiter_fk,o.void_fk as order_void_fk,o.total_amount as order_total_amount,o.customer_name as order_customer_name,o.payment as order_payment,o.notes as order_notes,o.down_payment as order_down_payment,o.received_date as order_received_date,o.void_reason as order_void_reason,o.discount as order_discount,ol.order_id_fk as oLine_order_id_fk,ol.product_id_fk as oLine_product_id_fk,ol.name as oLine_name,ol.code as oLine_code,ol.quantity as oLine_quantity,ol.price as oLine_price,ol.served as oLine_served, ol.served_items FROM order_tbl o, order_line_tbl ol WHERE o.id = ol.order_id_fk AND o.payment is null order by o.id";
	$structuredDataArray = array();
	$iterationStart = true;
	$catArray = array();
	$category = "";
	$res = $c->query($sql);
	if(hasRows($c,$sql)){
		while($row = $res->fetch_assoc()){
			$orderLine = array("order_id_fk"=>$row['oLine_order_id_fk'],"product_id_fk"=>$row['oLine_product_id_fk'],"name"=>$row['oLine_name'],"code"=>$row['oLine_code'],"quantity"=>$row['oLine_quantity'],"price"=>$row['oLine_price'],"served"=>$row['oLine_served'],"served_items"=>$row['served_items']);

			if($iterationStart){// at first set the category and add the array
				$iterationStart = false;
				$category = $row['order_id'];
				array_push($catArray,$orderLine);
			}
			elseif($category != $row['order_id']){ // if not the same id, push catArray to structuredDataArray and assign new id to the category
				$structuredDataArray[$category.""] = array("orderDetails"=>$orderDetails,"orderLine"=>$catArray);
				$catArray = array();
				array_push($catArray,$orderLine);
				$category = $row['order_id'];
			}
			else{ // if same id, push it to the category
				array_push($catArray,$orderLine);
			}
			$orderDetails = array("id"=>$row['order_id'],"date"=>$row['order_date'],"seat_number"=>$row['order_seat_number'],"cashier_fk"=>$row['order_cashier_fk'],"branch_fk"=>$row['order_branch_fk'],"waiter_fk"=>$row['order_waiter_fk'],"void_fk"=>$row['order_void_fk'],"total_amount"=>$row['order_total_amount'],"customer_name"=>$row['order_customer_name'],"payment"=>$row['order_payment'],"notes"=>$row['order_notes'],"down_payment"=>$row['order_down_payment'],"received_date"=>$row['order_received_date'],"void_reason"=>$row['order_void_reason'],"discount"=>$row['order_discount']);
		}
		$structuredDataArray[$category.""] = array("orderDetails"=>$orderDetails,"orderLine"=>$catArray);
	}
	print_r(json_encode($structuredDataArray));
}

?>