<?php
/* This file contains the elements for viewing */
function selectCategory($c){
	$sql = "SELECT id,name,category_code,description FROM category_tbl WHERE active=1";
	print_r(hasRows($c,$sql) ? json_encode(selectQuery($c,$sql)) : "");
}
function selectProduct($c){
	$sql = "SELECT id,name,description,picture,product_code,category_fk,stock,(SELECT name FROM category_tbl WHERE id=category_fk) as category_name ,price,available FROM product_tbl WHERE active=1";
	print_r(hasRows($c,$sql) ? json_encode(selectQuery($c,$sql)) : "");
}
function selectVat($c){
	$sql = "SELECT name,percentage FROM pricing_config_tbl WHERE id=1";
	print_r(hasRows($c,$sql) ? json_encode(selectQuery($c,$sql)) : "");
}
function selectServiceCharge($c){
	$sql = "SELECT name,percentage FROM pricing_config_tbl WHERE id=2";
	print_r(hasRows($c,$sql) ? json_encode(selectQuery($c,$sql)) : "");
}

function executeOrdersQuery($c,$sql){
	$structuredDataArray = array();
	$iterationStart = true;
	$catArray = array();
	$category = "";
	$res = $c->query($sql);
	if(hasRows($c,$sql)){
		while($row = $res->fetch_assoc()){
			$orderLine = array("productImg"=>$row["productImg"],"productValue"=>$row["productValue"],"order_line_id"=>$row["order_line_id"],"order_id_fk"=>$row['oLine_order_id_fk'],"product_id_fk"=>$row['oLine_product_id_fk'],"name"=>$row['oLine_name'],"code"=>$row['oLine_code'],"quantity"=>$row['oLine_quantity'],"price"=>$row['oLine_price'],"served"=>$row['oLine_served'],"served_items"=>$row['served_items'],"ready"=>$row['ready']);

			if($iterationStart){// at first set the category and add the array
				$iterationStart = false;
				$category = $row['order_id'];
				array_push($catArray,$orderLine);
			}
			elseif($category != $row['order_id']){ // if not the same id, push catArray to structuredDataArray and assign new id to the category
				array_push($structuredDataArray,array("orderDetails"=>$orderDetails,"orderLine"=>$catArray));
				$catArray = array();
				array_push($catArray,$orderLine);
				$category = $row['order_id'];
			}
			else{ // if same id, push it to the category
				array_push($catArray,$orderLine);
			}
			$orderDetails = array("id"=>$row['order_id'],"date"=>$row['order_date'],"seat_number"=>$row['order_seat_number'],"cashier_fk"=>$row['order_cashier_fk'],"branch_fk"=>$row['order_branch_fk'],"waiter_fk"=>$row['order_waiter_fk'],"void"=>$row['order_void_fk'],"total_amount"=>$row['order_total_amount'],"customer_name"=>$row['order_customer_name'],"payment"=>$row['order_payment'],"notes"=>$row['order_notes'],"down_payment"=>$row['order_down_payment'],"received_date"=>$row['order_received_date'],"void_reason"=>$row['order_void_reason'],"printed"=>$row['printed'],"discount"=>$row['order_discount'],"discount_percentage"=>$row['discount_percentage'],"vat"=>$row['vat'],"service_charge"=>$row['service_charge'],"cashier_name"=>$row['cashier_name']);
		}
		array_push($structuredDataArray,array("orderDetails"=>$orderDetails,"orderLine"=>$catArray));
	}
	print_r(json_encode($structuredDataArray));
}


?>