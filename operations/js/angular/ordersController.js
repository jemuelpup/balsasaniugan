app.controller("viewOrders",function($scope,dbOperations,$timeout){
	$scope.orders = [];
	var serveLocked = false;
	var selectedOrder = {}
	$('.modal').modal();
	$scope.job = 0;
	dbOperations.views("GetEmployeeAccess",{}).then(function(res){
		$scope.job = parseInt(res);
	});

	function formatData(){
		($scope.orders).forEach(function(e){
			e.orderDetails.payment = parseFloat(e.orderDetails.payment);	
			e.orderDetails.discount = parseFloat(e.orderDetails.discount);	
			e.orderDetails.discount_percentage = parseFloat(e.orderDetails.discount_percentage);	
			e.orderDetails.total_amount = parseFloat(e.orderDetails.total_amount);
			e.orderDetails.printed = parseInt(e.orderDetails.printed);
			e.orderDetails.received_date = new Date(e.orderDetails.received_date);
		});
		
	}
	function getOrders(){
		dbOperations.views("GetOrders",{}).then(function(res){
			$scope.orders = res;
			formatData();
			console.log(res);
		});
	}
	function getOrderTotalPrice(orderLineArray){
		return (orderLineArray).reduce(function(p,c){ return p+(parseFloat(c.price)*parseInt(c.quantity)); },0);
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
	$scope.setDataToPrint = function(order,totalPrice,discountPercentage,discountAmount,payment,discount){
		totalDiscount=totalPrice-(totalPrice*discountPercentage)*discountAmount;
		console.log(discount)
		console.log(totalPrice-discount+"<="+payment)
		if(totalPrice-totalDiscount<=payment){
			$scope.orderPrint = order;
			$scope.totalPricePrint = totalPrice;
			$scope.discountPercentagePrint = discountPercentage;
			$scope.discountAmountPrint = discountAmount;
			$scope.totalDiscount = $scope.discountAmountPrint+($scope.totalPricePrint*$scope.discountPercentagePrint/100);
			$scope.paymentPrint = payment;
			$scope.discountPrint = discount;
			dbOperations.processData("SetOrderPrinted",{orderID:order.orderDetails.id,totalPrice:totalPrice,discount:discount,discountPercentage:discountPercentage,payment:payment}).then(function(res){
				console.log(res.data);
				getOrders();
				window.print();
			});
			
		}
		else{
			alert("Not enough money.");
		}
	}
	$scope.orderPaid = function(orderDetails){
		console.log(orderDetails);
		if(orderDetails.printed>0){
			dbOperations.processData("SetOrderPaid",{orderID:orderDetails.id}).then(function(res){
				getOrders();
			});
		}
		else{
			alert("Printed order first");
		}
	}
	$scope.orderVoid = function(voidReason,orderLine,orderDetails){
		if(voidReason == null){
			alert("Voiding order must have reason");
		}
		else{
			if(!hasServedOrder(orderLine)){
				if(orderDetails.printed==0){
					if(confirm("Are you sure you want to void this order?")){
						dbOperations.processData("SetOrderVoid",{orderID:orderDetails.id,voidReason:voidReason}).then(function(res){
							getOrders();
						});
					}
				}
				else{
					alert("Cannot void printed order");
				}
			}
			else{
				alert("Cannot void order with served item.");
			}
		}
	}
	function hasServedOrder(order){
		return order.reduce(function(acc,curr){
			return acc + parseInt(curr.served_items);
		},0) > 0;
	}
	$scope.updateSeatIDModal = function(orderDetails){
		selectedOrder = orderDetails;
		console.log(selectedOrder);
		$('#edit-order-seat-id').modal('open');
		// console.log( $('#edit-order-seat-id'));
	}
	$scope.updateSeatID = function(newOrderID){
		selectedOrder.seat_number = newOrderID;
		dbOperations.processData("EditSeatID",{selectedOrder}).then(function(res){
			// console.log(res);
			getOrders();
			$('#edit-order-seat-id').modal('close');
		});
		// console.log(selectedOrder);
	}
});
app.controller("cashier",function($scope,dbOperations){
	dbOperations.views("GetEmployeeAccess",{}).then(function(res){
		$scope.job = res;
		console.log(res);
		if (!(parseInt(res)==3)){
			window.location.href = "/operations";
		}
	});
});
