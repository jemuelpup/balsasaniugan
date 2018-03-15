app.controller("employeeManagement",function($scope,dbOperations,$compile){
	dbOperations.views("GetEmployeeAccess",{}).then(function(res){
		if (res!=1){
			window.location.href = "/";
		}
	});
	/*Normalize Data In Order Table */ 
	dbOperations.processData("NormalizeDataInOrderTbl",{}).then(function(res){});

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
	var secondFirePrevent = true;
	function formatEmployeeData(){
		if(($scope.employees).length>0){
			($scope.employees).forEach(function(e){
				e.id = parseInt(e.id);
				e.position_fk = parseInt(e.position_fk);
				e.branch_fk = parseInt(e.branch_fk);
				e.modified_by_fk = parseInt(e.modified_by_fk);
				e.gender = parseInt(e.gender);
				e.salary = parseFloat(e.salary);
				e.birth_day = formatDate(e.birth_day);
				e.fixed = parseInt(e.fixed);
			});
		}
	}
	// convert string date data to date format
	function formatDate(inputDate) { return  new Date(inputDate); }
	// get the employee data on the database
	function getEmployees(){
		dbOperations.views("GetEmployee",{}).then(function(res){
			$scope.employees = res;
			// console.log(res);
			formatEmployeeData();
		});
	}
	/*
		$scope functions. These functions are like event handlers
	*/
	// add employee to the database
	$scope.addEmployee = function(){
		$scope.employeeFields.position_fk = $("select#addEmployeePosition").val();
		$scope.employeeFields.branch_fk = $("select#addEmployeeBranch").val();
		$scope.employeeFields.gender = $("select#addEmployeeGender").val();
		// console.log($scope.employeeFields);
		dbOperations.processData("AddEmployee",$scope.employeeFields).then(function(res){
			var datainsertedID = res.data.id;// use this data for adding the pictures

			// dbOperations.uploadImageSaveToDB(res.data.id,"","/common/images/employees/").then(function(){
			// 	console.log(res);
			// });

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
		if(secondFirePrevent){// delete this after two fire bug solved
			$scope.accessFields.id = $scope.editemployeeFields.id;

			dbOperations.processData("AddAccess",$scope.accessFields).then(function(res){
				console.log(res);
				alert(res.data);
				$('#add-employee-access').modal('close');
			});
		}
		secondFirePrevent = !secondFirePrevent;// delete this after two fire bug solved
	}
	$scope.editEmployee = function(){/*
		
		/**/
		if(dbOperations.isConvertibleToInteger($("select#updateEmployeePosition").val())){
			$scope.editemployeeFields.position_fk = $("select#updateEmployeePosition").val();
		}
		if(dbOperations.isConvertibleToInteger($("select#updateEmployeeBranch").val())){
			$scope.editemployeeFields.branch_fk = $("select#updateEmployeeBranch").val();
		}
		if(dbOperations.isConvertibleToInteger($("select#updateEmployeeGender").val())){
			$scope.editemployeeFields.gender = $("select#updateEmployeeGender").val();
		}
		// console.log($scope.editemployeeFields);
		dbOperations.processData("EditEmployee",$scope.editemployeeFields).then(function(res){
			getEmployees();
			$("#edit-employee").modal("close");
		});
	}
	$scope.deleteEmployee = function(){
		if($scope.editemployeeFields.fixed){
			alert("Unable to delete fixed employee");
		}
		else{
			if(confirm("Are you sure you want to delete this employee")){
				dbOperations.processData("RemoveEmployee",$scope.editemployeeFields).then(function(res){
					getEmployees();
				});
			}
		}
	}
	/*
		Function calls
	*/
	getEmployees();
});
app.controller("productManagement",function($http,$scope,$timeout,dbOperations){
	/*
		Variables
	*/
	$scope.categories = [];
	$scope.editCategoryFields = {};
	$scope.categoryFields = {}; //means object
	/*
		functions
	*/
	// convert the string data to the right data type
	function formatCategoryData(){
		if(($scope.categories).length>0){
			($scope.categories).forEach(function(c){
				c.id = parseInt(c.id);
			});
		}
	}
	// convert string date data to date format
	function formatDate(inputDate) { return  new Date(inputDate); }
	// get the category data on the database
	function getcategories(){
		dbOperations.views("GetCategory",{}).then(function(res){
			$scope.categories = res;
			formatCategoryData();
			$timeout(function () {
		       $('select').material_select();
		    }, 500);
			// console.log("dumaan sa get categories");
			// $('select').material_select();
		});
	}
	// $('select').click(function(){
	// 	$('select').material_select();
	// });
	/*
		$scope functions. These functions are like event handlers
	*/
	// add category to the database
	$scope.addCategory = function(){
		dbOperations.processData("AddCategory",$scope.categoryFields).then(function(res){
			getcategories();
			$('#add-category').modal('close');
		});
	}
	// select the active index and sets all the fields to the edit modal
	$scope.categoryIndex = function(categoryData){
		($scope.categories).forEach(function(e){ e.selected = false; });//set selected false in the object
		$scope.categories[categoryData].selected = true;
		$scope.editCategoryFields = (($scope.categories)[categoryData]);
	}

	$scope.editCategory = function(){
		// console.log($scope.editCategoryFields);
		dbOperations.processData("EditCategory",$scope.editCategoryFields).then(function(res){
			console.log(res);
			getcategories();
			$("#edit-category").modal("close");
		});
	}
	$scope.deleteCategory = function(){
		if(confirm("Are you sure you want to delete this category")){
			dbOperations.processData("RemoveCategory",$scope.editCategoryFields).then(function(res){
				getcategories();
			});
		}
	}
	getcategories();

	/*
		Variables
	*/
	$scope.products = [];
	$scope.editProductFields = {};
	$scope.productFields = {}; //means object
	/*
		functions
	*/
	// convert the string data to the right data type
	function formatProductData(){
		if(($scope.products).length>0){
			($scope.products).forEach(function(c){
				c.id = parseInt(c.id);
				c.category_fk = parseInt(c.category_fk);
				c.price = parseFloat(c.price);
			});
		}
	}
	// get the product data on the database
	function getProducts(){
		dbOperations.views("GetProduct",{}).then(function(res){
			$scope.products = res;
			console.log(res);
			formatProductData();
			
		});
	}
	/*
		$scope functions. These functions are like event handlers
	*/
	// add product to the database
	$scope.addProduct = function(){
		$scope.productFields.category_fk = $("select#poductCategory").val();
		// console.log($scope.productFields);
		dbOperations.processData("AddProduct",$scope.productFields).then(function(res){
			uploadImageSaveToDB(res.data.id,"");
			getProducts();
			// console.log(res);
		});
	}
	// nakuha lang sa youtube yung process na ito... replace this if success in adding in service
	function uploadImageSaveToDB(productID,oldImg){
      	var form_data = new FormData();  
		angular.forEach($scope.files, function(file){  
		    form_data.append('file', file);  
		});
		form_data.append('pID',productID);
		form_data.append('oldImg',oldImg);
		$http.post('/admin/upload.php', form_data,  
		{  
		    transformRequest: angular.identity,  
		    headers: {'Content-Type': undefined,'Process-Data': false}  
		}).then(function(response){
			// console.log(response)
			getProducts();
		});  
	}
	// select the active index and sets all the fields to the edit modal
	$scope.productIndex = function(productData){
		($scope.products).forEach(function(e){ e.selected = false; });//set selected false in the object
		$scope.products[productData].selected = true;
		$scope.editProductFields = (($scope.products)[productData]);
	}

	$scope.editProduct = function(){
		if(dbOperations.isConvertibleToInteger($("#editProductCategory").val())){
			$scope.editProductFields.category_fk = $("#editProductCategory").val();
		}
		// console.log($scope.editProductFields.category_fk);
		dbOperations.processData("EditProduct",$scope.editProductFields).then(function(res){
			uploadImageSaveToDB($scope.editProductFields.id,$scope.editProductFields.picture)
			getProducts();
			$("#edit-product").modal("close");
			$('input:file').val("");
		});
	}
	$scope.deleteProduct = function(){
		if(confirm("Are you sure you want to delete this product")){
			dbOperations.processData("RemoveProduct",$scope.editProductFields).then(function(res){
				getProducts();
			});
		}
	}
	getProducts();
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
	function formatPositionData(){
		if(($scope.positions).length>0){
			($scope.positions).forEach(function(p){
				p.id = parseInt(p.id);
				p.fixed = parseInt(p.fixed);
			});
		}
	}
	//get the pusitions data()
	function getPositions(){
		dbOperations.views("GetPosition",{}).then(function(res){
			$scope.positions = res;
			console.log(res);
			formatPositionData();
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
		// console.log($scope.editPositionFields);
	}
	
	$scope.editPosition = function(){
		// console.log($scope.editPositionFields);
		dbOperations.processData("EditPosition",$scope.editPositionFields).then(function(res){
			getPositions();
			$("#edit-position").modal("close");
		});
		
	}
	$scope.deletePosition = function(){
		if($scope.editPositionFields.fixed){
			alert("Unable to delete fixed position.");
		}
		else{
			if(confirm("Are you sure you want to delete this Position")){
				dbOperations.processData("RemovePosition",$scope.editPositionFields).then(function(res){
					getPositions();
				});
			}
		}
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
	function formatBranchData(){
		if(($scope.branches).length>0){
			($scope.branches).forEach(function(b){
				b.id = parseInt(b.id);
				b.fixed = parseInt(b.fixed);
			});
		}
	}
	//get the pusitions data()
	function getBranches(){
		dbOperations.views("GetBranch",{}).then(function(res){
			$scope.branches = res;
			formatBranchData();
			console.log(res);
		});
	}
	$scope.addBranch = function(){
		// console.log($scope.branchFields);
		dbOperations.processData("AddBranch",$scope.branchFields).then(function(res){
			// console.log(res);
			getBranches();
		});
	}
	$scope.branchIndex = function(branchData){
		($scope.branches).forEach(function(e){ e.selected = false; });//set selected false in the object
		$scope.branches[branchData].selected = true;
		$scope.editBranchFields = (($scope.branches)[branchData]);
		// console.log($scope.editBranchFields);
	}

	$scope.editBranch = function(){
		// console.log($scope.editBranchFields);
		dbOperations.processData("EditBranch",$scope.editBranchFields).then(function(res){
			// console.log(res);
			getBranches();
			$("#edit-branch").modal("close");
		});
	}
	$scope.deleteBranch = function(){
		if($scope.editBranchFields.fixed){
			alert("Unable to delete fixed branch");
		}
		else{
			if(confirm("Are you sure you want to delete this Branch")){
				dbOperations.processData("RemoveBranch",$scope.editBranchFields).then(function(res){
					getBranches();
				});
			}
		}
	}
	/*
		Function calls
	*/
	getBranches();
});
app.controller("reports",function($scope,dbOperations){
	console.log("nasa reports");
	$scope.fromdateInput = new Date();
	$scope.todateInput = new Date(($scope.fromdateInput).getTime() + (24 * 60 * 60 * 1000));
	$scope.transactions = [];
	$scope.sales = 0;
	function formatData(){
		($scope.transactions).forEach(function(e){
			e.orderDetails.payment = parseFloat(e.orderDetails.payment);
			e.orderDetails.down_payment = parseFloat(e.orderDetails.down_payment);
			e.orderDetails.total_amount = parseFloat(e.orderDetails.total_amount);
			e.orderDetails.vat = parseFloat(e.orderDetails.vat);
			e.orderDetails.service_charge = parseFloat(e.orderDetails.service_charge);
		});
	}
	function getTotalSales(){
		$scope.sales = ($scope.transactions).reduce(function(acc,cur){
			return acc+(cur.orderDetails.total_amount);
		},0);
		console.log($scope.sales+" ito yun");
	}
	$scope.getTransactionData = function(){
		if($scope.fromdateInput<$scope.todateInput){
			dbOperations.views("GetTransactionsFromTo",{
				from:$scope.fromdateInput,
				to:$scope.todateInput
			}).then(function(res){
				console.log(res);
				$scope.transactions = res;
				formatData();
				getTotalSales();
			});
		}
		else{
			alert("Invalid Date Input.");
		}
	}
	$scope.getTransactionData();
});
app.controller("userInterface",function($scope,$http){
	$scope.tabTitle = "Reports";
	$scope.sideNavActive = false;

	function hideSections(){
		$scope.employeeManagement = false;
		$scope.productManagement = false;
		$scope.buisnessManagement = false;
		$scope.reports = false;
	}
	$scope.showemployeeManagement = function(){$scope.tabTitle ="Employee management";
		hideSections();$scope.sideNavActive = false;$scope.employeeManagement = true;
	}
	$scope.showproductManagement = function(){$scope.tabTitle ="Product management";
		hideSections();$scope.sideNavActive = false;$scope.productManagement = true;
	}
	$scope.showbuisnessManagement = function(){$scope.tabTitle ="Buisness management";
		hideSections();$scope.sideNavActive = false;$scope.buisnessManagement = true;
	}
	$scope.showreports = function(){$scope.tabTitle ="Reports";
		hideSections();$scope.sideNavActive = false;$scope.reports = true;
	}
	$scope.reports = true;
	$('.modal').modal();
	$scope.openEditEmployee = function(){
		$('.modal').modal();
		$('#edit-employee').modal('open');
		$('select').val();
		$('select').material_select();
	}
	$scope.openAddEmployeeModal = function(){
		$('#add-employee').modal('open');
		$('select').material_select();
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
	$scope.openEditCategoryModal = function(){
		$('#edit-category').modal('open');
	}
	$scope.openEditProductModal = function(){
		// console.log(editProductCategorySelected);
		// $("#editProductCategory").material_select('destroy');
		// $("#editProductCategory option").eq(editProductCategorySelected).attr("selected",true);
		// $("#editProductCategory").material_select();
		$('#edit-product').modal('open');
	}
	$scope.menuClick = function(){
		$scope.sideNavActive = true;
	}
	$scope.shadowClick = function(){
		$scope.sideNavActive = false;
	}
	$scope.logout = function(){
		$http({
			method:"POST",
			url:"/common/login.php",
			data: { 'process': "logout", 'data':'' }
		}).then(function success(res){
			window.location.href = "/";
		});
	}
	// $('select').material_select();
});



	


