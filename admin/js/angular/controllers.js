app.controller("employeeManagement",function($scope,dbOperations){
	/*
		Variables
	*/
	$scope.employees = [];
	$scope.editemployeeFields = {};
	$scope.employeeFields = {}; //means object
	$scope.employeeSelected = {};
	/*
		functions
	*/
	// convert the string data to the right data type
	function formatData(){
		if(($scope.employees).length>0){
			($scope.employees).forEach(function(e){
				e.id = parseInt(e.id);
				e.position_fk = parseInt(e.position_fk);
				e.branch_fk = parseInt(e.branch_fk);
				e.modified_by_fk = parseInt(e.modified_by_fk);
				e.gender = parseInt(e.gender);
				e.salary = parseFloat(e.salary);
				e.birth_day = formatDate(e.birth_day);
			});
		}
	}
	// convert string date data to date format
	function formatDate(inputDate) { return  new Date(inputDate); }
	// get the employee data on the database
	function getEmployees(){
		dbOperations.views("GetEmployee",{}).then(function(res){
			$scope.employees = res;
			formatData();
		});
	}
	/*
		$scope functions. These functions are like event handlers
	*/
	// add employee to the database
	$scope.addEmployee = function(){
		dbOperations.processData("AddEmployee",$scope.employeeFields).then(function(res){
			getEmployees();
			$('#add-employee').modal('close');
		});
	}
	// select the active index and sets all the fields to the edit modal
	$scope.employeeIndex = function(employeeData){
		($scope.employees).forEach(function(e){ e.selected = false; });//set selected false in the object
		$scope.employees[employeeData].selected = true;
		$scope.editemployeeFields = (($scope.employees)[employeeData]);
	}
	$scope.addEmployeeAccess = function(){
		$scope.accessFields.id = $scope.editemployeeFields.id;
		dbOperations.processData("AddAccess",$scope.accessFields).then(function(res){
			console.log(res);
			$('#add-employee-access').modal('close');
		});
	}
	$scope.editEmployee = function(){
		dbOperations.processData("EditEmployee",$scope.editemployeeFields).then(function(res){
			getEmployees();
			$("#edit-employee").modal("close");
		});
	}
	// $scope.editEmployee = function(){
	// 	console.log("pumasok dito");
	// 	$('#employee').modal('open');
	// }

	


	/*
		Function calls
	*/
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

	$scope.positions = [];
	$scope.editPositionFields = {};
	$scope.positionFields = {}; //means object
	$scope.positionSelected = {};
	/*
		functions
	*/
	// convert the string data to the right data type
	function formatData(){
		if(($scope.positions).length>0){
			($scope.positions).forEach(function(p){
				p.id = parseInt(p.id);
			});
		}
	}
	//get the pusitions data()
	function getPositions(){
		dbOperations.views("GetPosition",{}).then(function(res){
			$scope.positions = res;
			formatData();
		});
	}
	$scope.addPosition = function(){
		dbOperations.processData("AddPosition",$scope.positionFields).then(function(res){
			getPositions();
		});
	}
	$scope.positionIndex = function(positionData){
		($scope.positions).forEach(function(e){ e.selected = false; });//set selected false in the object
		$scope.positions[positionData].selected = true;
		$scope.editPositionFields = (($scope.positions)[positionData]);
		console.log($scope.editPositionFields);
	}
	
	$scope.editPosition = function(){
		// console.log($scope.editPositionFields);
		dbOperations.processData("EditPosition",$scope.editPositionFields).then(function(res){
			getPositions();
			$("#edit-position").modal("close");
		});
		
	}
	/*
		Function calls
	*/
	getPositions();

	$scope.branches = [];
	$scope.editBranchFields = {};
	$scope.branchFields = {}; //means object
	$scope.branchSelected = {};
	/*
		functions
	*/
	// convert the string data to the right data type
	function formatData(){
		if(($scope.branches).length>0){
			($scope.branches).forEach(function(b){
				b.id = parseInt(b.id);
			});
		}
	}
	//get the pusitions data()
	function getBranches(){
		dbOperations.views("GetBranch",{}).then(function(res){
			console.log(res);
			$scope.branches = res;
			formatData();
		});
	}
	$scope.addBranch = function(){
		console.log($scope.branchFields);
		// dbOperations.processData("AddBranch",$scope.branchFields).then(function(res){
		// 	console.log(res);
		// 	getBranches();
		// });
	}
	$scope.branchIndex = function(branchData){
		($scope.branches).forEach(function(e){ e.selected = false; });//set selected false in the object
		$scope.branches[branchData].selected = true;
		$scope.editBranchFields = (($scope.branches)[branchData]);
		console.log($scope.editBranchFields);
	}

	$scope.editBranch = function(){
		console.log($scope.editBranchFields);
		dbOperations.processData("EditBranch",$scope.editBranchFields).then(function(res){
			console.log(res);
			getBranches();
			$("#edit-branch").modal("close");
		});
	}
	/*
		Function calls
	*/
	getBranches();
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
	$scope.buisnessManagement = true;
	$('.modal').modal();
	$scope.openEditEmployee = function(){
		$('#edit-employee').modal('open');
	}
	$scope.openAddEmployeeModal = function(){
		$('#add-employee').modal('open');
	}
	$scope.openAddEmployeeAccessModal = function(){
		$('#add-employee-access').modal('open');
	}
	$scope.openEditPositionModal = function(){
		$('#edit-position').modal('open');
	}
	$scope.openEditBranchModal = function(){
		$('#edit-branch').modal('open');
	}
});