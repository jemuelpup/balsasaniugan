app.directive("categoryList",function(){
	return {
		template:`
			<h3 class="mb0">Category list</h3>
			<ul class="categoryList">
				<li ng-click="categoryClicked('')">All</li>
				<li ng-repeat="x in categories" ng-click="categoryClicked(x.id)">{{x.name}}</li>
			</ul>
		`
	};
});

app.directive("productList",function(){
	return {
		template:`
			<h3>Product list</h3>
			<div class="headerSearch">
				<input placeholder="Search" id="{{category.categoryName}}" type="text" class="validate" ng-model="productFilter" ng-focus="focus=true" ng-blur="focus=false">
			</div>
			<ul class="collection productList">
				<li class="collection-item avatar" 
				ng-repeat="x in products | filter:productFilter | filter:{category_fk:selectedCategory}" 
				ng-init="expand=0"
				ng-class="x.available ? '':'outOfStock'">
					<img src="{{x.picture}}" alt="" class="circle">
					<span class="title">{{x.name}}</span>
					<p class="desc" ng-show="!expand" ng-click="expand = !expand">{{x.description | limitTo: 20 }}{{x.description.length > 20 ? '...' : ''}}</p>
					<p class="fullDesc" ng-show="expand" ng-click="expand = !expand">{{x.description}}</p>
					<p class="price">Php. {{x.price}}</p>
					<div class="secondary-content">
						<input placeholder="Qty" type="number" ng-model="x.quantity">
					</div>
					<button class="waves-effect waves-light btn add" ng-click="addProductOrder(x.id,x.name,x.quantity,x.price,x.product_code);x.quantity=null" ng-class="x.available ? '':'hide'">ADD</button>
				</li>
			</ul>
		`
	};
});

app.directive("orderList",function(){
	return {
		template:`
		<div class="orderListBlock">
			<div class="message">
				<button class="btn" ng-class="orderDoneMsg ? 'active':''" ng-click="orderDoneMsg=false">Order Saved</button>
			</div>
			<h3>Order list</h3>
			<div class="orderList">
				<table>
					<thead>
						<tr class="tableHead">
							<th>Name</th>
							<th>Qty</th>
							<th>Price</th>
							<th>Total</th>
						</tr>
					</thead>
					<tbody>
						<tr ng-repeat="x in orderList">
							<td>{{x.name}}</td>
							<td>{{x.quantity}}</td>
							<td>{{x.price}}</td>
							<td class="removeFromOrder">{{x.quantity*x.price}} <span ng-click="removeFromOrder(orderList.indexOf(x))"><i class="material-icons">close</i></span></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		`
	};
});