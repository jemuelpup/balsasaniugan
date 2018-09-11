app.controller("OrderWindowController",function($scope,dbOperations,$interval){

	$scope.unservedOrders = [];

	function getUnservedOrders(){
		dbOperations.views("GetUnservedOrders",{}).then(function(res){
			$scope.unservedOrders = res;
			// console.log(res);
		});
	}
	$interval(function(){
		getUnservedOrders();
	}, 5000);   
	getUnservedOrders();
});