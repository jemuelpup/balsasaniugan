/*
@param:
process(String),
dataInputs(Object), -like in serialize array in jqueyr
callback(Function) - function call after the request
*/
app.service('dbOperations',function($http){
	this.processData = function(process,dataInputs){
		return $http({
			method:"POST",
			url:"/operations/functions.php",
			data: { 'process': process, 'data': dataInputs }
		}).then(function success(res){
			console.log("dumaan sa waiter service");
			return res;
		}, function error(err) {
			console.log(err);
	    });
	}
	this.views = function(process,data){
		console.log("Dumaan sa view");
		return $http({
			method:"POST",
			url:"/operations/views.php",
			data: { 'process': process, 'data':data }
		}).then(function success(res){
			// console.log(res);
			return res.data;
		},function error(err) {
			console.log("error");
			console.log(err);
	    });
	}
	this.isConvertibleToInteger = function(value) {
	  return /^\d+$/.test(value);
	}
	this.logout = function(){
		$http({
			method:"POST",
			url:"/common/login.php",
			data: { 'process': "logout", 'data':'' }
		}).then(function success(res){
			window.location.href = "/";
		});
	}
});
