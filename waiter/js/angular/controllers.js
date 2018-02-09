app.controller("operations",function($scope,dbOperations,$timeout){
	$scope.products= [];
	$scope.categories= [];
	$scope.selectedCategory='';
	$scope.orderList = [];
	$scope.seatID = "";
	$scope.customerName = "";
	$scope.orderNotes = "";
	$scope.downPayment = "";
	$scope.orderDoneMsg = false;
	function getProducts(){
		dbOperations.views("GetProduct",{}).then(function(res){
			// res.push({id:"",name:"all",description:"All products"});

			// console.log(res);

			$scope.products = res;
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
	$scope.categoryClicked = function(catID){$scope.selectedCategory = catID;}
	$scope.removeFromOrder = function(orderIndex){$scope.orderList.splice(orderIndex, 1);}
	$scope.saveOrders = function(){
		// console.log($scope.seatID);
		if(($scope.seatID)!=""){
			if($scope.orderList.length){
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
						$scope.orderList = [];
						$scope.seatID = "";
						$scope.customerName = "";
						$scope.orderNotes = "";
						$scope.downPayment = "";
						$scope.orderDoneMsg = true;
						$timeout( function(){ $scope.orderDoneMsg = false; }, 3000);
						// Materialize.toast('Order Saved', 4000)
						// reset all the input fields and the orderlist
					}
					
				});
			}
			else{
				console.log("Please add orders first");
			}
		}
		else{
			console.log("Please type the seat ID");
		}
	}

	getCategories();
	getProducts();
});
app.controller("viewOrders",function($scope,dbOperations){
	$scope.orders = [];
	dbOperations.views("GetOrders",{}).then(function(res){
		$scope.orders = res;
		console.log(res);
	});
});
