app.controller("employeeManagement",function($scope,dbOperations){

	$scope.employeeFields = {}; //means object
	console.log("Gumagana");
	

	$scope.addEmployee = function(){
		dbOperations.processData("AddEmployee",$scope.employeeFields).then(function(res){
			console.log(res);
		});
	}
});

app.controller("productManagement",function($scope,dbOperations){

	// $scope.functionName = function(){
	// 	dbOperations.processData("processName","").then(function(res){
	// 		console.log(res);
	// 	});
	// }
	console.log("Gumagana");
	$scope.addProduct = function(){
		dbOperations.processData("AddProduct",$scope.productFields).then(function(res){
			console.log(res);
		});
	}
	$scope.addCategory = function(){
		dbOperations.processData("AddCategory",$scope.categoryFields).then(function(res){
			console.log(res);
		});
	}
});
app.controller("buisnessManagement",function($scope,dbOperations){

	$scope.addPosition = function(){
		dbOperations.processData("AddPosition",$scope.positionFields).then(function(res){
			console.log(res);
		});
		console.log($scope.positionFields);
		// console.log("buisness");
	}
});
app.controller("reports",function($scope,dbOperations){

	// $scope.functionName = function(){
	// 	dbOperations.processData("processName","").then(function(res){
	// 		console.log(res);
	// 	});
	// }
	console.log("Gumagana");
	
});
