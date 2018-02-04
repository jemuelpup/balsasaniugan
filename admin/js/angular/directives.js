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
							<input ng-model="employeeFields.picture" name="picture" value="" type="text" class="validate" maxlength="50">
							<label for="picture">picture</label>
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
							<input ng-model="employeeFields.position_fk" name="position_fk" value="" type="number" class="validate" maxlength="50">
							<label for="position_fk">position_fk</label>
						</div>
						<div class="input-field col s12">
							<input ng-model="employeeFields.branch_fk" name="branch_fk" value="" type="number" class="validate" maxlength="50">
							<label for="branch_fk">branch_fk</label>
						</div>
						<div class="input-field col s12">
							<input ng-model="employeeFields.salary" name="salary" value="" type="number" class="validate" maxlength="50" required>
							<label for="salary">salary</label>
						</div>
						<div class="input-field col s12">
							<input ng-model="employeeFields.modified_by_fk" name="modified_by_fk" value="" type="number" class="validate" maxlength="50" required>
							<label for="modified_by_fk">modified_by_fk</label>
						</div>
						<div class="input-field col s12">
							<input ng-model="employeeFields.birth_day" name="birth_day" value="" type="date" class="validate" maxlength="50">
							<label for="birth_day" class="active">birth_day</label>
						</div>
						<div class="input-field col s12">
							<input ng-model="employeeFields.gender" name="gender" value="" type="number" class="validate" maxlength="50" required>
							<label for="gender">gender</label>
						</div>
						<button class="waves-effect waves-light btn" type="submit">Add</button>
						<button class="waves-effect waves-light btn">Clear</button>
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
			        <button class="waves-effect waves-light btn">Clear</button>
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
			                <input ng-model="editemployeeFields.picture" name="picture" value="" type="text" class="validate" maxlength="50" placeholder="">
			                <label for="picture" class="active">picture</label>
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
			                <input ng-model="editemployeeFields.position_fk" name="position_fk" value="" type="number" class="validate" maxlength="50" placeholder="">
			                <label for="position_fk" class="active">position_fk</label>
			            </div>
			            <div class="input-field col s12">
			                <input ng-model="editemployeeFields.branch_fk" name="branch_fk" value="" type="number" class="validate" maxlength="50" placeholder="">
			                <label for="branch_fk" class="active">branch_fk</label>
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
			                <input ng-model="editemployeeFields.gender" name="gender" value="" type="number" class="validate" maxlength="50" required placeholder="">
			                <label for="gender" class="active">gender</label>
			            </div>
			        </div>
			        <div class="modal-footer">
			            <button class="waves-effect waves-light btn" type="submit" ng-click="editItem()">Update</button>
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
				<h3>position_tbl</h3>
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
					<button class="waves-effect waves-light btn">Clear</button>
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
			    <h3>category_tbl</h3>
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
			        <button class="waves-effect waves-light btn">Clear</button>
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
			                <input ng-model="editCategoryFields.id" name="id" value="" type="number" class="validate" maxlength="50" required placeholder="">
			                <label for="id">id</label>
			            </div>
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
				<h3>product_tbl</h3>
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
						<input ng-model="productFields.picture" name="picture" value="" type="text" class="validate" maxlength="50">
						<label for="picture">picture</label>
					</div>
					<div class="input-field col s12">
						<input ng-model="productFields.item_code" name="item_code" value="" type="text" class="validate" maxlength="50">
						<label for="item_code">item_code</label>
					</div>
					<div class="input-field col s12">
						<input ng-model="productFields.category_fk" name="category_fk" value="" type="number" class="validate" maxlength="50">
						<label for="category_fk">category_fk</label>
					</div>
					<div class="input-field col s12">
						<input ng-model="productFields.price" name="price" value="" type="number" class="validate" maxlength="50">
						<label for="price">price</label>
					</div>
					<button class="waves-effect waves-light btn" type="submit">Add</button>
					<button class="waves-effect waves-light btn">Clear</button>
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
							<input ng-model="editProductFields.picture" name="picture" value="" type="text" class="validate" maxlength="50" placeholder="">
							<label for="picture">picture</label>
						</div>
						<div class="input-field col s12">
							<input ng-model="editProductFields.item_code" name="item_code" value="" type="text" class="validate" maxlength="50" placeholder="">
							<label for="item_code">item_code</label>
						</div>
						<div class="input-field col s12">
							<input ng-model="editProductFields.category_fk" name="category_fk" value="" type="number" class="validate" maxlength="50" placeholder="">
							<label for="category_fk">category_fk</label>
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

