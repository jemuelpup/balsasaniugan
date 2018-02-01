app.directive("addEmployee",function(){
	return {
		template:`
			<div class="employee">
			    <h3>employee_tbl</h3>
			    <form ng-submit="addEmployee()">
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
			    </form>
			</div>
		`
	};

});

app.directive("updateEmployee",function(){
	return {
		template:`
			<div id="employee" class="modal employee">
			    <form ng-submit="editEmployee()">
			        <div class="modal-content">
			            <h4>editemployee</h4>
			            <div class="input-field col s12">
			                <input ng-model="editemployeeFields.name" name="name" value="" type="text" class="validate" maxlength="50" required>
			                <label for="name" class="active">name</label>
			            </div>
			            <div class="input-field col s12">
			                <input ng-model="editemployeeFields.picture" name="picture" value="" type="text" class="validate" maxlength="50">
			                <label for="picture" class="active">picture</label>
			            </div>
			            <div class="input-field col s12">
			                <input ng-model="editemployeeFields.address" name="address" value="" type="text" class="validate" maxlength="50">
			                <label for="address" class="active">address</label>
			            </div>
			            <div class="input-field col s12">
			                <input ng-model="editemployeeFields.contact_number" name="contact_number" value="" type="text" class="validate" maxlength="50">
			                <label for="contact_number" class="active">contact_number</label>
			            </div>
			            <div class="input-field col s12">
			                <input ng-model="editemployeeFields.email" name="email" value="" type="text" class="validate" maxlength="50">
			                <label for="email" class="active">email</label>
			            </div>
			            <div class="input-field col s12">
			                <input ng-model="editemployeeFields.position_fk" name="position_fk" value="" type="number" class="validate" maxlength="50">
			                <label for="position_fk" class="active">position_fk</label>
			            </div>
			            <div class="input-field col s12">
			                <input ng-model="editemployeeFields.branch_fk" name="branch_fk" value="" type="number" class="validate" maxlength="50">
			                <label for="branch_fk" class="active">branch_fk</label>
			            </div>
			            <div class="input-field col s12">
			                <input ng-model="editemployeeFields.salary" name="salary" value="" type="number" class="validate" maxlength="50" required>
			                <label for="salary" class="active">salary</label>
			            </div>
			            <div class="input-field col s12">
			                <input ng-model="editemployeeFields.modified_by_fk" name="modified_by_fk" value="" type="number" class="validate" maxlength="50" required>
			                <label for="modified_by_fk" class="active">modified_by_fk</label>
			            </div>
			            <div class="input-field col s12">
			                <input ng-model="editemployeeFields.birth_day" name="birth_day" value="" type="date" class="validate" maxlength="50">
			                <label for="birth_day" class="active">birth_day</label>
			            </div>
			            <div class="input-field col s12">
			                <input ng-model="editemployeeFields.gender" name="gender" value="" type="number" class="validate" maxlength="50" required>
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

app.directive("addEmployeeAccess",function(){
	return {
		template:``
	}
});