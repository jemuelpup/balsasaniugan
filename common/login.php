<?php

require $_SERVER['DOCUMENT_ROOT'].'/common/dbconnect.php';
$postdata = file_get_contents("php://input");
$request = json_decode($postdata);
$process = $request->process;
$data = $request->data;

switch($process){
	case "login":{login($conn,$data);}break;
}


function login($c,$d){
	$stmt = $c->prepare('SELECT employee_id_fk,(SELECT position_fk FROM employee_tbl WHERE id = employee_id_fk) as position FROM access_tbl a WHERE username = ? AND password = ? AND active=1');
	$stmt->bind_param('ss', $d->username, $d->password);
	$tempEmployeeId = 0;
	$tempPosition = 0;
	if($stmt->execute()){
		$stmt->store_result();
		$stmt->bind_result($employee_id_fk,$position);
		while (mysqli_stmt_fetch($stmt)) {
			$tempEmployeeId = $employee_id_fk; 
			$tempPosition = $position; 
	    }
	}
	if($tempEmployeeId and $tempPosition){
		session_start();
		$_SESSION["employeeID"] = $tempEmployeeId;
		$_SESSION["position"] = $tempPosition;
		$loc = "";
		// switch ($position) {
		// 	case 'value':
		// 		# code...
		// 		break;
			
		// 	default:
		// 		# code...
		// 		break;
		// }
		echo "$position";

	}
	else{
		echo "0";
	}
}



?>