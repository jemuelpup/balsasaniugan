app.controller("login",function($scope,$http){
	$scope.validateAcess = function(){
		console.log($scope.loginForm)
		var access = $http({
			method:"POST",
			url:"/operations/views.php",
			data: { 'process': "GetAccess", 'data':$scope.loginForm }
		}).then(function success(res){
			console.log(res);
			// return res.data;
		},function error(err) { return 0; });



		console.log(access);
	}
});
