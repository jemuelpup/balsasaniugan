<?php
/* This file contains the elements for viewing */

include $_SERVER['DOCUMENT_ROOT'].'/common/commonfunctions.php';
require $_SERVER['DOCUMENT_ROOT'].'/common/dbconnect.php';
require $_SERVER['DOCUMENT_ROOT'].'/common/commonViews.php';
session_start();
$process="";

if(isset($_POST['process'])){
	$process = $_POST['process'];
}
else{
	$postdata = file_get_contents("php://input");
	$request = json_decode($postdata);
	$process = $request->process;
	$data = $request->data;
}
// $process = "GetCategory";
switch($process){
	case "GetOrders":{selectOrders($conn);}break;
	case "GetCategory":{selectCategory($conn);}break;
	case "GetProduct":{selectProduct($conn);}break;
	case "GetUnservedOrders":{selectUnservedOrders($conn);}break;
	case "GetEmployeeAccess":{echo $_SESSION["position"];}break;
	case "GetVAT":{selectVat($conn);}break;
	case "GetServiceCharge":{selectServiceCharge($conn);}break;
}


function selectUnservedOrders($c){
	$sql = "SELECT (SELECT picture FROM product_tbl WHERE id=ol.product_id_fk) as productImg, ol.id as order_line_id, o.id as order_id,o.order_date as order_date,o.seat_number as order_seat_number,o.cashier_fk as order_cashier_fk,o.branch_fk as order_branch_fk,o.waiter_fk as order_waiter_fk,o.void as order_void_fk,o.total_amount as order_total_amount,o.customer_name as order_customer_name,o.payment as order_payment,o.notes as order_notes,o.down_payment as order_down_payment,o.received_date as order_received_date,o.void_reason as order_void_reason,o.printed,o.discount as order_discount,o.discount_percentage,ol.order_id_fk as oLine_order_id_fk,ol.product_id_fk as oLine_product_id_fk,ol.name as oLine_name,ol.code as oLine_code,ol.quantity as oLine_quantity,ol.price as oLine_price,ol.served as oLine_served, ol.served_items, o.vat, o.service_charge FROM order_tbl o, order_line_tbl ol WHERE
	 o.void=0 AND o.id = ol.order_id_fk AND o.done=0 AND ol.served_items <> ol.quantity order by o.id";
	executeOrdersQuery($c,$sql);
}

function selectOrders($c){
	$sql = "SELECT (SELECT picture FROM product_tbl WHERE id=ol.product_id_fk) as productImg, ol.id as order_line_id, o.id as order_id,o.order_date as order_date,o.seat_number as order_seat_number,o.cashier_fk as order_cashier_fk,o.branch_fk as order_branch_fk,o.waiter_fk as order_waiter_fk,o.void as order_void_fk,o.total_amount as order_total_amount,o.customer_name as order_customer_name,o.payment as order_payment,o.notes as order_notes,o.down_payment as order_down_payment,o.received_date as order_received_date,o.void_reason as order_void_reason,o.printed,o.discount as order_discount,o.discount_percentage,ol.order_id_fk as oLine_order_id_fk,ol.product_id_fk as oLine_product_id_fk,ol.name as oLine_name,ol.code as oLine_code,ol.quantity as oLine_quantity,ol.price as oLine_price,ol.served as oLine_served, ol.served_items, o.vat, o.service_charge FROM order_tbl o, order_line_tbl ol WHERE
	 o.void=0 AND o.id = ol.order_id_fk AND o.done=0 order by o.id";
	executeOrdersQuery($c,$sql);
}



// selectEmployee($conn);


?>