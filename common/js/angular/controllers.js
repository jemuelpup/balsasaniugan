app.controller("login",function($scope,$http,$timeout){
	$scope.validateAcess = function(){
		console.log($scope.loginForm)
		var access = $http({
			method:"POST",
			url:"/common/login.php",
			data: { 'process': "login", 'data':$scope.loginForm }
		}).then(function success(res){
			console.log("dumaan dito")
			console.log(res);
			// make access for admin here...
			if(res.data=="2" || res.data=="3"){
				window.location.href = "/operations";
			}
			else{
				$scope.shake = true;
				$timeout(function(){$scope.shake = false}, 830);
			}
			// return res.data;
		},function error(err) { return 0; });

		

		console.log(access);
	}
});
