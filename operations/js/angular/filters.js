app.filter('filterName',function(){
	return function(param){
		return param;
	}
});

app.filter('seatIDFilter', function() {
  return function(data, nested, search) {    
    if (!search)// if search has no data, return the whole string
      return data;
    return data.filter(function(x) {// else, filter the data
      var props = nested.split('.');
      var temp = x;
      for(var prop of props){
         temp = temp[prop];
      }
      return temp == search;
    });
  }
})