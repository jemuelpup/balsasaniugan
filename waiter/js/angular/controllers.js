app.controller("operations",function($scope,dbOperations){
	$scope.products= [];
	$scope.categories= [];


	function getProducts(){
		dbOperations.views("GetProduct",{}).then(function(res){
			console.log(res);
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
	$scope.addProductOrder = function(prod){
		console.log(prod);
	}
	$scope.categoryClicked = function(catID){
		console.log(catID);
		$scope.selectedCategory = catID;
	}
	getCategories();
	getProducts();
});
