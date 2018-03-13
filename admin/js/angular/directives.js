app.directive("addEmployee",function(){
	return {
		template:`
			<div id="add-employee" class="modal employee">
				<form ng-submit="addEmployee()">
					<div class="modal-content">
						<h4>Add Employee</h4>
						<div class="input-field col s12">
							<input ng-model="employeeFields.name" name="name" value="" type="text" class="validate" maxlength="50" required>
							<label for="name">name</label>
						</div>
						<div class="input-field col s12">
							<input ng-model="employeeFields.address" name="address" value="" type="text" class="validate" maxlength="50">
							<label for="address">address</label>
						</div>
						<div class="input-field col s12">
							<input ng-model="employeeFields.contact_number" name="contact_number" value="" type="text" class="validate" maxlength="50">
							<label for="contact_number">contact_number</label>
						</div>
						<div class="input-field col s12">
							<input ng-model="employeeFields.email" name="email" value="" type="text" class="validate" maxlength="50">
							<label for="email">email</label>
						</div>
						<div class="input-field col s12">
							<select name="employeePosition" id="addEmployeePosition">
								<option value="" disabled selected>Choose your option</option>
								<option value="{{e.id}}" ng-repeat="e in positions">{{e.name}}</option>
							</select>
							<label>Position</label>
						</div>
						<div class="input-field col s12">
							<select name="employeeBranch" id="addEmployeeBranch">
								<option value="" disabled selected>Choose your option</option>
								<option value="{{e.id}}" ng-repeat="e in branches">{{e.name}}</option>
							</select>
							<label>Branch</label>
						</div>
						<div class="input-field col s12">
							<input ng-model="employeeFields.salary" name="salary" value="" type="number" class="validate" maxlength="50" required>
							<label for="salary">salary</label>
						</div>
						<div class="input-field col s12">
							<input ng-model="employeeFields.birth_day" name="birth_day" value="" type="date" class="validate" maxlength="50">
							<label for="birth_day" class="active">birth_day</label>
						</div>
						<div class="input-field col s12">
							<select name="employeeGender" id="addEmployeeGender">
								<option value="" disabled selected>Choose your option</option>
								<option value="1">Male</option>
								<option value="0">Female</option>
							</select>
							<label>Gender</label>
						</div>
						<button class="waves-effect waves-light btn" type="submit">Add</button>
						<button class="waves-effect waves-light btn" type="reset">Clear</button>
					</div>
				</form>
			</div>
		`
	};
});
app.directive("addEmployeeAccess",function(){
	return {
		template:`
			<div id="add-employee-access" class="modal employee">
				<form ng-submit="addEmployeeAccess()">
				<div class="modal-content">
			    	<h3>access_tbl</h3>
			        <div class="input-field col s12">
			            <input ng-model="accessFields.username" name="username" value="" type="text" class="validate" maxlength="50" required>
			            <label for="username">username</label>
			        </div>
			        <div class="input-field col s12">
			            <input ng-model="accessFields.password" name="password" value="" type="text" class="validate" maxlength="50" required>
			            <label for="password">password</label>
			        </div>
			    </div>
        		<div class="modal-footer">
			        <button class="waves-effect waves-light btn" ng-click="addEmployeeAccess()" type="submit">Add</button>
			        <button class="waves-effect waves-light btn" type="reset">Clear</button>
			    </div>
			    </form>
			</div>
		`
	}
});
app.directive("updateEmployee",function(){
	return {
		template:`
			<div id="edit-employee" class="modal employee">
			    <form ng-submit="editEmployee()">
			        <div class="modal-content">
			            <h4>editemployee</h4>
			            <div class="input-field col s12">
			                <input ng-model="editemployeeFields.name" name="name" value="" type="text" class="validate" maxlength="50" required placeholder="">
			                <label for="name" class="active">name</label>
			            </div>
			            <div class="input-field col s12">
			                <input ng-model="editemployeeFields.address" name="address" value="" type="text" class="validate" maxlength="50" placeholder="">
			                <label for="address" class="active">address</label>
			            </div>
			            <div class="input-field col s12">
			                <input ng-model="editemployeeFields.contact_number" name="contact_number" value="" type="text" class="validate" maxlength="50" placeholder="">
			                <label for="contact_number" class="active">contact_number</label>
			            </div>
			            <div class="input-field col s12">
			                <input ng-model="editemployeeFields.email" name="email" value="" type="text" class="validate" maxlength="50" placeholder="">
			                <label for="email" class="active">email</label>
			            </div>
			            <div class="input-field col s12">
										<select name="employeePositionUpdate" id="updateEmployeePosition">
											<option value="" disabled selected>Choose your option</option>
											<option value="{{e.id}}" ng-repeat="e in positions">{{e.name}}</option>
										</select>
										<label>Position</label>
									</div>
									<div class="input-field col s12">
										<select name="employeeBranchUpdate" id="updateEmployeeBranch">
											<option value="" disabled selected>Choose your option</option>
											<option value="{{e.id}}" ng-repeat="e in branches">{{e.name}}</option>
										</select>
										<label>Branch</label>
									</div>
			            <div class="input-field col s12">
			                <input ng-model="editemployeeFields.salary" name="salary" value="" type="number" class="validate" maxlength="50" required placeholder="">
			                <label for="salary" class="active">salary</label>
			            </div>
			            <div class="input-field col s12">
			                <input ng-model="editemployeeFields.modified_by_fk" name="modified_by_fk" value="" type="number" class="validate" maxlength="50" required placeholder="">
			                <label for="modified_by_fk" class="active">modified_by_fk</label>
			            </div>
			            <div class="input-field col s12">
			                <input ng-model="editemployeeFields.birth_day" name="birth_day" value="" type="date" class="validate" maxlength="50" placeholder="">
			                <label for="birth_day" class="active">birth_day</label>
			            </div>
									<div class="input-field col s12">
										<select name="employeeGenderUpdate" id="updateEmployeeGender">
											<option value="" disabled selected>Choose your option</option>
											<option value=1>Male</option>
											<option value=0>Female</option>
										</select>
										<label>Gender</label>
									</div>

			        </div>
			        <div class="modal-footer">
			            <button class="waves-effect waves-light btn" type="submit">Update</button>
			        </div>
			    </form>
			</div>
		`
	};
});
app.directive("addPosition",function(){
	return {
		template:`
			<div class="position">
				<h3>Positions</h3>
				<form ng-submit="addPosition()">
					<div class="input-field col s12">
					    <input ng-model="positionFields.name" name="name" value="" type="text" class="validate" maxlength="50" required>
					    <label for="name">name</label>
					</div>
					
					<div class="input-field col s12">
					    <input ng-model="positionFields.description" name="description" value="" type="text" class="validate" maxlength="50">
					    <label for="description">description</label>
					</div>
				
					<button class="waves-effect waves-light btn" type="submit">Add</button>
					<button class="waves-effect waves-light btn" type="reset">Clear</button>
				</form>
			</div>
		`
	}
})
app.directive("updatePosition",function(){
	return {
		template:`
			<div id="edit-position" class="modal position">
			    <form ng-submit="editPosition()">
			        <div class="modal-content">
			            <h4>editposition</h4>
			            <div class="input-field col s12">
			                <input ng-model="editPositionFields.name" name="name" value="" type="text" class="validate" maxlength="50" required placeholder="">
			                <label for="name">name</label>
			            </div>
			            <div class="input-field col s12">
			                <input ng-model="editPositionFields.description" name="description" value="" type="text" class="validate" maxlength="50" placeholder="">
			                <label for="description">description</label>
			            </div>
			        </div>
			        <div class="modal-footer">
			            <button class="waves-effect waves-light btn" type="submit" ng-click="editPosition()">Update</button>
			        </div>
			    </form>
			</div>
		`
	}
});
app.directive("updateBranch",function(){
	return {
		template: `
			<div id="edit-branch" class="modal branch">
			    <form ng-submit="editBranch()">
			        <div class="modal-content">
			            <h4>Edit Branch</h4>
			            <div class="input-field col s12">
			                <input ng-model="editBranchFields.name" name="name" value="" type="text" class="validate" maxlength="50" required placeholder="">
			                <label for="name">name</label>
			            </div>
			            <div class="input-field col s12">
			                <input ng-model="editBranchFields.address" name="address" value="" type="text" class="validate" maxlength="50" placeholder="">
			                <label for="address">address</label>
			            </div>
			            <div class="input-field col s12">
			                <input ng-model="editBranchFields.description" name="description" value="" type="text" class="validate" maxlength="50" placeholder="">
			                <label for="description">description</label>
			            </div>
			            <div class="input-field col s12">
			                <input ng-model="editBranchFields.branch_code" name="branch_code" value="" type="text" class="validate" maxlength="50" placeholder="">
			                <label for="branch_code">branch_code</label>
			            </div>
			        </div>
			        <div class="modal-footer">
			            <button class="waves-effect waves-light btn" type="submit" ng-click="editBranch()">Update</button>
			        </div>
			    </form>
			</div>
				`
	}
});
app.directive("addCategory",function(){
	return {
		template: `
			<div class="category">
			    <h3>Add Category</h3>
			    <form ng-submit="addCategory()">
			        <div class="input-field col s12">
			            <input ng-model="categoryFields.name" name="name" value="" type="text" class="validate" maxlength="50" required>
			            <label for="name">name</label>
			        </div>
			        <div class="input-field col s12">
			            <input ng-model="categoryFields.category_code" name="category_code" value="" type="text" class="validate" maxlength="50">
			            <label for="category_code">category_code</label>
			        </div>
			        <div class="input-field col s12">
			            <input ng-model="categoryFields.description" name="description" value="" type="text" class="validate" maxlength="50">
			            <label for="description">description</label>
			        </div>
			        <button class="waves-effect waves-light btn" type="submit">Add</button>
			        <button class="waves-effect waves-light btn" type="reset">Clear</button>
			    </form>
			</div>
		`
	}
});
app.directive("updateCategory",function(){
	return {
		template: `
			<div id="edit-category" class="modal category">
			    <form ng-submit="editCategory()">
			        <div class="modal-content">
			            <h4>Edit Category</h4>
			            <div class="input-field col s12">
			                <input ng-model="editCategoryFields.name" name="name" value="" type="text" class="validate" maxlength="50" required placeholder="">
			                <label for="name">name</label>
			            </div>
			            <div class="input-field col s12">
			                <input ng-model="editCategoryFields.category_code" name="category_code" value="" type="text" class="validate" maxlength="50" placeholder="">
			                <label for="category_code">category_code</label>
			            </div>
			            <div class="input-field col s12">
			                <input ng-model="editCategoryFields.description" name="description" value="" type="text" class="validate" maxlength="50" placeholder="">
			                <label for="description">description</label>
			            </div>
			        </div>
			        <div class="modal-footer">
			            <button class="waves-effect waves-light btn" type="submit" ng-click="editCategory()">Update</button>
			        </div>
				</div>
			</form>
		`
	}
});
app.directive("addProduct",function(){
	return {
		template: `
			<div class="product">
				<h3>Add Product</h3>
				<form ng-submit="addProduct()">
					<div class="input-field col s12">
						<input ng-model="productFields.name" name="name" value="" type="text" class="validate" maxlength="50" required>
						<label for="name">name</label>
					</div>
					<div class="input-field col s12">
						<input ng-model="productFields.description" name="description" value="" type="text" class="validate" maxlength="50" required>
						<label for="description">description</label>
					</div>
					<div class="input-field col s12">
						<p>Picture</p><input ng-model="productFields.picture" file-input="files" name="picture" value="" type="file" class="validate">
					</div>
					<div class="input-field col s12">
						<input ng-model="productFields.product_code" name="product_code" value="" type="text" class="validate" maxlength="50">
						<label for="product_code">product_code</label>
					</div>
					<div class="input-field col s12">
						<select name="itemCategory" id="productCategory">
							<option value="" disabled selected>Choose your option</option>
							<option value="{{c.id}}" ng-repeat="c in categories">{{c.name}}</option>
						</select>
					    <label>Category</label>
					</div>
					<div class="input-field col s12">
						<input ng-model="productFields.price" name="price" value="" type="number" class="validate" maxlength="50">
						<label for="price">price</label>
					</div>
					<button class="waves-effect waves-light btn" type="submit">Add</button>
					<button class="waves-effect waves-light btn" type="reset">Clear</button>
				</form>
			</div>
		`
	}
});
app.directive("updateProduct",function(){
	return {
		template: `
			<div id="edit-product" class="modal product">
				<form ng-submit="editProduct()">
					<div class="modal-content">
						<h4>editproduct</h4>
						<div class="input-field col s12">
							<input ng-model="editProductFields.name" name="name" value="" type="text" class="validate" maxlength="50" required placeholder="">
							<label for="name">name</label>
						</div>
						<div class="input-field col s12">
							<input ng-model="editProductFields.description" name="description" value="" type="text" class="validate" maxlength="50" required placeholder="">
							<label for="description">description</label>
						</div>
						<div class="input-field col s12">
							<p>Picture</p><input ng-model="productFields.picture" file-input="files" name="picture" value="" type="file" class="validate">
							<img class="prodImgPreview" src="{{editProductFields.picture}}" alt="Product picture" />
						</div>
						<div class="input-field col s12">
							<input ng-model="editProductFields.product_code" name="product_code" value="" type="text" class="validate" maxlength="50" placeholder="">
							<label for="product_code">product_code</label>
						</div>
						<div class="input-field col s12">
							<select name="itemCategory" id="editProductCategory">
								<option value="" disabled selected>Choose your option</option>
								<option value="{{c.id}}" ng-repeat="c in categories">{{c.name}}</option>
							</select>
						    <label>Category</label>
						</div>
						<div class="input-field col s12">
							<input ng-model="editProductFields.price" name="price" value="" type="number" class="validate" maxlength="50" placeholder="">
							<label for="price">price</label>
						</div>
					</div>
					<div class="modal-footer">
						<button class="waves-effect waves-light btn" type="submit" ng-click="editProduct()">Update</button>
					</div>
				</form>
			</div>
		`
	}
});

// study this... nakuha lng sa youtube
app.directive("fileInput", function($parse){  
  return{  
       link: function($scope, element, attrs){  
            element.on("change", function(event){  
                 var files = event.target.files;
                 //console.log(files[0].name);  
                 $parse(attrs.fileInput).assign($scope, element[0].files);  
                 $scope.$apply();  
            });  
       }  
  }  
});  



