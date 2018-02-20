/*
@param:
process(String),
dataInputs(Object), -like in serialize array in jqueyr
callback(Function) - function call after the request
*/
app.service('dbOperations',function($http){
	//this function calls the function for insert and update query
	this.processData = function(process,dataInputs){
		return $http({
			method:"POST",
			url:"/admin/functions.php",
			data: { 'process': process, 'data': dataInputs }
		}).then(function success(res){
			return res;
		}, function error(err) {
			console.log(err);
	    });
	}
	// this function calls the function for select query
	this.views = function(process,data){
		// console.log("Dumaan sa view");
		return $http({
			method:"POST",
			url:"/admin/views.php",
			data: { 'process': process, 'data':data }
		}).then(function success(res){
			// console.log(res);
			return res.data;
		},function error(err) {
			console.log("error");
			console.log(err);
	    });
	}
	// check if the string is convertible to integer.(nakuha lang sa internet: regular expression)
	this.isConvertibleToInteger = function(value) {
	  return /^\d+$/.test(value);
	}

	/*
	Status: on going
	Desc: function for uploading picture in database
	*/
	this.uploadImageSaveToDB = function(productID,oldImg,path){
      	var form_data = new FormData();  
		angular.forEach($scope.files, function(file){  
		    form_data.append('file', file);  
		});
		form_data.append('pID',productID);
		form_data.append('oldImg',oldImg);
		form_data.append('path',path);
		$http.post('/admin/upload.php', form_data,  
		{  
		    transformRequest: angular.identity,  
		    headers: {'Content-Type': undefined,'Process-Data': false}  
		}).then(function(response){
			console.log(response)
			getProducts();
		});  
	}
});
