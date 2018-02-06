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
	case "AddEmployee":{insertEmployee($conn,$data);}break;
	case "EditEmployee":{updateEmployee($conn,$data);}break;
	case "AddPosition":{insertPosition($conn,$data);}break;
	case "EditPosition":{updatePosition($conn,$data);}break;
	case "AddProduct":{insertProduct($conn,$data);}break;
	case "EditProduct":{updateProduct($conn,$data);}break;
	case "AddCategory":{insertCategory($conn,$data);}break;
	case "EditCategory":{updateCategory($conn,$data);}break;
	case "AddAccess":{insertAccess($conn,$data);}break;
	case "EditAccess":{updateAccess($conn,$data);}break;
	case "AddBranch":{insertBranch($conn,$data);}break;
	case "EditBranch":{updateBranch($conn,$data);}break;
}


/* function area */
// employee functions
function insertEmployee($c,$d){
	$adminId = 1;
	$dataInserted = true;
	$sql = $c->prepare("INSERT INTO employee_tbl(name,picture,address,contact_number,email,position_fk,branch_fk,salary,modified_by_fk,birth_day,gender)VALUES(?,?,?,?,?,?,?,?,?,?,?)");
	$sql->bind_param('sssssiidisi',$d->name,$d->picture,$d->address,$d->contact_number,$d->email,$d->position_fk,$d->branch_fk,$d->salary,$adminId,$d->birth_day,$d->gender);
	$dataInserted = ($sql->execute() === TRUE) ? true : false;
	if($dataInserted){
		print_r(json_encode(array("id"=>$sql->insert_id)));
	}
	else{
		echo "error";
	}
	$sql->close();
	/**/
}
function updateEmployee($c,$d){
	$adminId = 1;
	$sql = $c->prepare("UPDATE employee_tbl SET name = ?, picture = ?, address = ?, contact_number = ?, email = ?, position_fk = ?, branch_fk = ?, salary = ?, modified_by_fk = ?, birth_day = ?, gender = ? WHERE id = ?"); 
	$sql->bind_param('sssssiidisii',$d->name,$d->picture,$d->address,$d->contact_number,$d->email,$d->position_fk,$d->branch_fk,$d->salary,$adminId,$d->birth_day,$d->gender,$d->id);
	$msg = ($sql->execute() === TRUE) ? "Editting Employee success" : "Error: " . $sql . "<br>" . $c->error;
	$sql->close();
}
//position functions
function insertPosition($c,$d){
	$sql = $c->prepare("INSERT INTO position_tbl(name,description)VALUES(?,?)");
	$sql->bind_param('ss',$d->name,$d->description);
	$msg = ($sql->execute() === TRUE) ? "Adding position success" : "Error: " . $sql . "<br>" . $c->error;
	$sql->close();
}
function updatePosition($c,$d){
	$sql = $c->prepare("UPDATE position_tbl SET name = ?, description = ? WHERE id = ?");
	$sql->bind_param('ssi',$d->name,$d->description,$d->id);
	$msg = ($sql->execute() === TRUE) ? "Editting Position success" : "Error: " . $sql . "<br>" . $c->error;
	$sql->close();
}
//product functions - return the id of the image after insert....
function insertProduct($c,$d){
	$adminId = 1;
	$dataInserted = true;
	$sql = $c->prepare("INSERT INTO product_tbl(name,description,item_code,category_fk,modified_by_fk,price)VALUES(?,?,?,?,?,?)");
	$sql->bind_param('sssiid',$d->name,$d->description,$d->item_code,$d->category_fk,$adminId,$d->price);
	$dataInserted = ($sql->execute() === TRUE) ? true : false;
	if($dataInserted){
		print_r(json_encode(array("id"=>$sql->insert_id)));
	}
	else{
		echo "error";
	}
	$sql->close();
}
function updateProduct($c,$d){
	$adminId = 1;
	$sql = $c->prepare("UPDATE product_tbl SET name = ?, description = ?, picture = ?, item_code = ?, category_fk = ?, modified_by_fk = ?, price = ? WHERE id = ?");
	$sql->bind_param('ssssiidi',$d->name,$d->description,$d->picture,$d->item_code,$d->category_fk,$d->$adminId,$d->price,$d->id);
	$msg = ($sql->execute() === TRUE) ? "Editting Product success" : "Error: " . $sql . "<br>" . $c->error;
	$sql->close();
}
//category functions
function insertCategory($c,$d){
	$sql = $c->prepare("INSERT INTO category_tbl(name,category_code,description)VALUES(?,?,?)");
	$sql->bind_param('sss',$d->name,$d->category_code,$d->description);
	$msg = ($sql->execute() === TRUE) ? "Adding Category success" : "Error: " . $sql . "<br>" . $c->error;
	$sql->close();
}
function updateCategory($c,$d){
	$sql = $c->prepare("UPDATE category_tbl SET name = ?, category_code = ?, description = ? WHERE id = ?");
	$sql->bind_param('sssi',$d->name,$d->category_code,$d->description,$d->id);
	$msg = ($sql->execute() === TRUE) ? "Editting Category success" : "Error: " . $sql . "<br>" . $c->error;
	$sql->close();
}
//access functions
function insertAccess($c,$d){
	$sql = $c->prepare("INSERT INTO access_tbl(employee_id_fk,username,password)VALUES(?,?,?) ON DUPLICATE KEY UPDATE username=VALUES(username),password=VALUES(password)");
	$sql->bind_param('iss',$d->id,$d->username,$d->password);
	$msg = ($sql->execute() === TRUE) ? "Adding access success" : "Error: " . $sql . "<br>" . $c->error;
	$sql->close();
}
function insertBranch($c,$d){
	$adminId = 1;
	$sql = $c->prepare("INSERT INTO branch_tbl(name,address,description,branch_code,modified_by_fk)VALUES(?,?,?,?,?)"); 
	$sql->bind_param('ssssi',($d->name),($d->address),($d->description),($d->branch_code),$adminId);// change the modified by
	$msg = ($sql->execute() === TRUE) ? "Adding branch success" : "Error: " . $sql . "<br>" . $c->error;
	$sql->close();
}
function updateBranch($c,$d){
	$adminId = 1;
	$sql = $c->prepare("UPDATE branch_tbl SET name = ?, address = ?, description = ?, branch_code = ?, modified_by_fk = ? WHERE id=?");
	$sql->bind_param('ssssii',$d->name,$d->address,$d->description,$d->branch_code,$adminId,$d->id);// change the modified by
	$msg = ($sql->execute() === TRUE) ? "Editting branch success" : "Error: " . $sql . "<br>" . $c->error;
	$sql->close();
}
// function updateAccess($c,$d){
// 	$sql = $c->prepare("UPDATE access_tbl SET employee_id_fk = ?, username = ?, password = ?");
// 	$sql->bind_param('iss',$d->employee_id_fk,$d->username,$d->password);
// 		$sql->close();
// 	$msg = ($sql->execute() === TRUE) ? "Editting access success" : "Error: " . $sql . "<br>" . $c->error;
// 	$sql->close();
// }






?>