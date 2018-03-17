<?php
/* This file contains the elements for viewing */
session_start();
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
	$data = $request->data;
}
// $process = "GetCategory";
switch($process){
	case "GetEmployee":{selectEmployee($conn);}break;
	case "GetPosition":{selectPosition($conn);}break;
	case "GetBranch":{selectBranch($conn);}break;
	case "GetCategory":{selectCategory($conn);}break;
	case "GetProduct":{selectProduct($conn);}break;
	case "GetTransactionsFromTo":{
		selectTransactionsBetweenDate($conn,$data);}break;
	case "GetEmployeeAccess":{echo $_SESSION["position"];}break;

	case "GetVAT":{selectVat($conn);}break;
	case "GetServiceCharge":{selectServiceCharge($conn);}break;
}

/* 
Ready this function 
This function is for reports.
*/
function selectProductOrderQuantity(){
	$sql="SELECT ol.order_id_fk, (SELECT name FROM product_tbl where ol.product_id_fk = id) as productName, SUM(ol.quantity) FROM order_line_tbl ol, order_tbl o WHERE ol.order_id_fk = o.id GROUP BY productName";

}
// selectEmployee($conn);
function selectEmployee($c){
	$sql = "SELECT id,name,picture,address,contact_number,email,position_fk,(SELECT name FROM position_tbl WHERE id=position_fk) as position_name,branch_fk,(SELECT name FROM branch_tbl WHERE id = branch_fk) as branch_name,salary,modified_by_fk,(SELECT name FROM employee_tbl WHERE id=modified_by_fk) as admin_name,birth_day,gender,fixed FROM employee_tbl WHERE active=1";
	print_r(hasRows($c,$sql) ? json_encode(selectQuery($c,$sql)) : "");
}

function selectPosition($c){
	$sql = "SELECT id,name,description,fixed FROM position_tbl WHERE active=1";
	print_r(hasRows($c,$sql) ? json_encode(selectQuery($c,$sql)) : "");
}
function selectBranch($c){
	$sql = "SELECT id,name,address,description,branch_code,fixed FROM branch_tbl WHERE active=1";
	print_r(hasRows($c,$sql) ? json_encode(selectQuery($c,$sql)) : "");
}
function selectTransactionsBetweenDate($c,$d){
	$sql = "SELECT (SELECT picture FROM product_tbl WHERE id=ol.product_id_fk) as productImg, ol.id as order_line_id, o.id as order_id,o.order_date as order_date, o.seat_number as order_seat_number,o.cashier_fk as order_cashier_fk,(SELECT name FROM employee_tbl WHERE id=o.cashier_fk) as cashier_name, o.branch_fk as order_branch_fk,o.waiter_fk as order_waiter_fk, o.void as order_void_fk,o.total_amount as order_total_amount, o.customer_name as order_customer_name,o.payment as order_payment, o.notes as order_notes,o.down_payment as order_down_payment, o.received_date as order_received_date,o.void_reason as order_void_reason, o.printed, o.discount as order_discount,o.discount_percentage,ol.order_id_fk as oLine_order_id_fk, ol.product_id_fk as oLine_product_id_fk,ol.name as oLine_name, ol.code as oLine_code,ol.quantity as oLine_quantity,ol.price as oLine_price, ol.served as oLine_served, ol.served_items, o.vat, o.service_charge FROM order_tbl o, order_line_tbl ol  WHERE o.id = ol.order_id_fk AND o.payment > 0 AND o.done=1 AND o.received_date BETWEEN '".substr($d->from,0,10)."' AND '".substr($d->to,0,10)."'"." order by o.id";
	// echo $sql;
	executeOrdersQuery($c,$sql);
}
/*/ This function needs some edit
function selectFunctionNameWCond($c,$d){
	$sql = "SELECT id,name,category_code,description FROM category_tbl WHERE active = 1 and name = $d->name";// add security here
	print_r(hasRows($c,$sql) ? json_encode(selectQuery($c,$sql)) : "");
}
/**/


?>