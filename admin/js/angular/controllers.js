app.controller("employeeManagement",function($scope,dbOperations){

	$scope.employees = [];
	$scope.editemployeeFields = {};
	$scope.employeeFields = {}; //means object




	function formatData(){
		($scope.employees).forEach(function(e){
			e.id = parseInt(e.id);
			e.position_fk = parseInt(e.position_fk);
			e.branch_fk = parseInt(e.branch_fk);
			e.modified_by_fk = parseInt(e.modified_by_fk);
			e.gender = parseInt(e.gender);
			e.salary = parseFloat(e.salary);
			e.birth_day = formatDate(e.birth_day);
			// $scope.editemployeeFields = e;
		});

	}
	function formatDate(inputDate) {
		return  new Date(inputDate);
	}


	// functions
	function getEmployees(){
		dbOperations.views("GetEmployee",{}).then(function(res){
			$scope.employees = res;
			formatData();
			// console.log($scope.employees);
		});
	}
	// scope functions
	$scope.addEmployee = function(){
		dbOperations.processData("AddEmployee",$scope.employeeFields).then(function(res){
			console.log(res);
		});
	}
	$scope.employeeIndex = function(employeeData){

		$scope.editemployeeFields = (($scope.employees)[employeeData]);
	}

	
	getEmployees();
});

app.controller("productManagement",function($scope,dbOperations){

	// $scope.functionName = function(){
	// 	dbOperations.processData("processName","").then(function(res){
	// 		console.log(res);
	// 	});
	// }
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
	
});
app.controller("userInterface",function($scope){
	$scope.sideNavActive = false;

	function hideSections(){
		$scope.employeeManagement = false;
		$scope.productManagement = false;
		$scope.buisnessManagement = false;
		$scope.reports = false;
	}
	$scope.showemployeeManagement = function(){hideSections();$scope.employeeManagement = true;}
	$scope.showproductManagement = function(){hideSections();$scope.productManagement = true;}
	$scope.showbuisnessManagement = function(){hideSections();$scope.buisnessManagement = true;}
	$scope.showreports = function(){hideSections();$scope.reports = true;}
	$scope.employeeManagement = true;
	$('.modal').modal();

	$scope.editEmployee = function(){
		console.log("pumasok dito");
		$('#employee').modal('open');
	}

	console.log("working here");
});