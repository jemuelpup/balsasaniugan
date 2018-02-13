app.controller("viewOrders",function($scope,dbOperations){
	$scope.orders = [];
	var serveLocked = false;
	function getOrders(){
		dbOperations.views("GetOrders",{}).then(function(res){
			$scope.orders = res;
			console.log(res);
		});
	}
	function getOrderTotalPrice(orderLineArray){
		return (orderLineArray).reduce(function(p,c){
			return p+(parseFloat(c.price)*parseInt(c.quantity));
		},0);
	}
	$scope.orderPaid = function(orderID,discount,orderLineArray){
		var totalPrice = getOrderTotalPrice(orderLineArray);
		discount = discount ? discount:0;
		console.log(orderID,discount,totalPrice);
		if(confirm("Does the payment given to cashier?")){
			dbOperations.processData("SetOrderPaid",{orderID:orderID,totalPrice:totalPrice,discount:discount}).then(function(res){
				console.log(res);
				getOrders();
				// window.location.href = "/operations/addToOrder.html";
			});
		}
	}
	$scope.addProductsToOrder = function(orderID){
		console.log(orderID);
		dbOperations.processData("SetOrderID",{orderID:orderID}).then(function(res){
			window.location.href = "/operations/addToOrder.html";
		});
	}
	$scope.getTotalPrice = function(orderLineArray){
		return getOrderTotalPrice(orderLineArray);
	}
	$scope.removeFromOrderLine = function(orderLineID){
		if(confirm("Do you want to remove this from orderline?")){
			dbOperations.processData("RemoveFromOrderLine",{orderLineID:orderLineID}).then(function(res){
				getOrders();
			});
		}
	}
	$scope.serveItem = function(orderLineID,quantity,served){
		console.log(parseInt(quantity),parseInt(served))
		if(parseInt(quantity)>parseInt(served)){
			if(!serveLocked){
				serveLocked = true;
				dbOperations.processData("ServeOrder",{orderLineID:orderLineID}).then(function(res){
					// console.log(res);
					getOrders();
					serveLocked = false;
				});
			}
		}
		else{
			console.log("Items already served");
		}
	}
	getOrders();
});