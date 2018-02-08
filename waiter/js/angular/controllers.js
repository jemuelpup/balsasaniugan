app.controller("operations",function($scope,dbOperations){
	$scope.products= [];
	$scope.categories= [];
	$scope.selectedCategory='';
	$scope.orderList = [];

	$scope.seatID = "";
	$scope.customerName = "";
	$scope.orderNotes = "";


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
	$scope.addProductOrder = function(id,name,qty,price){
		if(qty==null){
			qty = 1
		}
		if(dbOperations.isConvertibleToInteger(qty)){
			$scope.orderList.push({id:id,name:name,quantity:qty,price:price});
			console.log({id:id,name:name,quantity:qty,price:price});
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
				dbOperations.processData("AddOrder",{
					customerName:$scope.customerName,
					seatID:$scope.seatID,
					orderNotes:$scope.orderNotes,
					orderedItems:$scope.orderList}
				).then(function(res){
					console.log(res);
					
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
