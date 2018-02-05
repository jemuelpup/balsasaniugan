<?php
include $_SERVER['DOCUMENT_ROOT'].'/common/commonfunctions.php';
require $_SERVER['DOCUMENT_ROOT'].'/common/dbconnect.php';
// POST variables
$prodID = $_POST['pID'];
$oldImg = $_POST['oldImg'];
$newImage = "";
$allowImgUpload = true;
// get the new image uploaded
if(isset($_FILES["file"])){
	$newImage =  "/common/images/products/".$_FILES["file"]["name"];
}
echo "$newImage";
// if has old img, and not using default image delete that image...
if($newImage==""){
	// using default imagename is invalid
	if($newImage=="/common/images/products/default_food_img.jpg"){
		echo "default image name must not be used as a image name";
		$allowImgUpload = false;
	}
}
else{
	// check if the old image is not default name if not, delete the old image
	if(!($oldImg=="/common/images/products/default_food_img.jpg")){
		if(!($oldImg=="")){
			unlink($_SERVER['DOCUMENT_ROOT'].$oldImg);// unlink the old image
		}
	}
}
// upload the file
if($allowImgUpload)
	if(!empty($_FILES))
	{
		$temp = explode(".", $_FILES["file"]["name"]);
		$newfilename = $temp[0] .$prodID. '.' . $temp[1];
		$path = $_SERVER['DOCUMENT_ROOT'].'/common/images/products/' . $newfilename;


		if(move_uploaded_file($_FILES['file']['tmp_name'], $path))
		{
			$sql = "UPDATE product_tbl SET picture = '/common/images/products/".$newfilename."' WHERE id = $prodID"; 
			mysqli_query($conn, $sql);
		}
	}
/**/
 ?>