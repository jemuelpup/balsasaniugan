<?php

require $_SERVER['DOCUMENT_ROOT'].'/common/dbconnect.php';
$postdata = file_get_contents("php://input");
$request = json_decode($postdata);
$data = $request->data; // this is the passed data

function startSession($employeeID,$position){
	session_start();
	$_SESSION["employeeID"] = $employeeID;
	$_SESSION["position"] = $position;
}

function login($c,$userName,$uPass){
	$stmt = $c->prepare('SELECT employee_id_fk FROM `access_tbl` WHERE username = ? AND password = ?');
	$stmt->bind_param('ss', $d->username,$d->password);
	$tempEmployeeId = 0;
	if($stmt->execute()){
		$stmt->store_result();
		$stmt->bind_result($employee_id_fk);
		while (mysqli_stmt_fetch($stmt)) {
			$tempEmployeeId = $employee_id_fk; 
	    }
		if((int)$stmt->num_rows>0) {
			// start the session. add the access...

			echo "Username already exist";
		}
		else{

		}
		
	}
	$stmt->close();
}

?>