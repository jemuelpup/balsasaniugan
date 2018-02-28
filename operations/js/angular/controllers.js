app.controller("operations",function($scope,dbOperations,$timeout,$window){
	$scope.products= [];
	$scope.categories= [];
	$scope.selectedCategory='';
	$scope.orderList = [];
	$scope.seatID = "";
	$scope.customerName = "";
	$scope.orderNotes = "";
	$scope.downPayment = "";
	$scope.orderDoneMsg = false;
	$scope.showCategories = false;
	$scope.showOrderedItems = false;

	var addToOrderLineButtonClicked = false;

	function formatProduct(){
		if(($scope.products).length>0){
			($scope.products).forEach(function(e){
				e.available = parseInt(e.available);
				e.stock = parseInt(e.stock);
			});
		}
	}

	function getProducts(){
		dbOperations.views("GetProduct",{}).then(function(res){
			// res.push({id:"",name:"all",description:"All products"});
			$scope.products = res;
			formatProduct();
			console.log("nasa GetProducts");
			console.log($scope.products);
			
		});
	}
	function getCategories(){
		dbOperations.views("GetCategory",{}).then(function(res){
			console.log(res);
			$scope.categories = res;
		});
	}
	/* Scope functions */
	$scope.addProductOrder = function(id,name,qty,price,p_code){
		if(qty==null){
			qty = 1
		}
		if(dbOperations.isConvertibleToInteger(qty)){
			$scope.orderList.push({id:id,name:name,quantity:qty,price:price,productCode:p_code});
			console.log({id:id,name:name,quantity:qty,price:price,productCode:p_code});
		}
		else{
			alert("invalid dat input");
		}
	}
	$scope.updateStocks = function(prodID,stock){
		dbOperations.processData("UpdateStocks",{prodID: prodID,stock:stock}).then(function(res){
			getProducts();
		});
	}
	$scope.setProductNotAvailable = function(prodID){
		dbOperations.processData("SetProductNotAvailable",{prodID: prodID}).then(function(res){
			getProducts();
		});
	}

	$scope.setProductAvailable = function(prodID){
		dbOperations.processData("SetProductAvailable",{prodID: prodID}).then(function(res){
			getProducts();
		});
	}
	$scope.categoryClicked = function(catID){
		$scope.selectedCategory = catID;
		$scope.showCategories = false;
		$scope.showOrderedItems = false;
	}
	$scope.sideNavOverlayClicked = function(){
		$scope.showCategories = false;
		$scope.showOrderedItems = false;
	}
	$scope.removeFromOrder = function(orderIndex){$scope.orderList.splice(orderIndex, 1);}
	$scope.saveOrders = function(){
		// console.log($scope.seatID);
		if(($scope.seatID)!=""){//if seatID is written
			if($scope.orderList.length){// if order list is not empty
				var downPayment = $scope.downPayment=="" ? 0 : $scope.downPayment;
				console.log(downPayment);
				dbOperations.processData("AddOrder",{
					customerName: $scope.customerName,
					seatID: $scope.seatID,
					orderNotes: $scope.orderNotes,
					downPayment: downPayment,
					orderedItems: $scope.orderList}
				).then(function(res){
					console.log(res);
					if(res!="error"){
						if(res.data.length>0){
							alert(res.data);
						}
						$scope.orderList = [];
						$scope.seatID = "";
						$scope.customerName = "";
						$scope.orderNotes = "";
						$scope.downPayment = "";
						$scope.orderDoneMsg = true;
						$timeout( function(){ $scope.orderDoneMsg = false; }, 3000);
						// Materialize.toast('Order Saved', 4000)
						// reset all the input fields and the orderlist
							
						getProducts();
					}
					
				});
			}
			else{
				alert("Please add orders first");
			}
		}
		else{
			alert("Please add the seat ID");
		}
	}
	$scope.addToOrderLine = function(){
		if($scope.orderList.length){ // if order list is not empty
			console.log($scope.orderList);
			if(!addToOrderLineButtonClicked){
				addToOrderLineButtonClicked = true;
				dbOperations.processData("AddOrderLine",{orderedItems: $scope.orderList}).then(function(res){
					console.log(res);
					if(res!="error"){
						dbOperations.processData("SetOrderID",{orderID:0}).then(function(res){
							window.location.href = "/operations/viewOrders.html";
						});
					}
				});
			}
		}
		else{
			alert("Please add order first");
		}
	}
	$scope.backToMainPage = function(){
		if($scope.orderList.length){
			if(confirm("Orders are not saved. Are you sure you want to exit?")){
				$window.location.href = "/operations/";
			}
		}
		else{
			$window.location.href = "/operations/";
		}
	}
	getCategories();
	getProducts();

	
});

app.controller("viewOrderLine",function($scope,dbOperations){
	// check if you already have the order id in your sessing
	dbOperations.processData("GetOrderID",{}).then(function(res){
		// pag walang order id sa session, return home
		if(!(res.data.orderID)){// means merong order id sa session
			console.log("add function here to return to view Orders page");
			window.location.href = "/operations/viewOrders.html";
		}
	});

});
