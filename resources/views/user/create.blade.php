@extends('layout')

@section('content')

@include('includes.errors') 

<form id="task_form" action="{{ route('user.store') }}" method="POST">
    {{ csrf_field() }}

    <div class="col-md-7">
    	<label>Create new User <span class="glyphicon glyphicon-plus" aria-hidden="true"></span></label>

            <div class="form-group">
                <input type="text" class="form-control" placeholder="Enter User Full Name" name="name" value="{{ old('name') }}">
            </div>

            <div class="form-group">
                <input type="text" class="form-control" placeholder="Enter User Email" name="email" value="{{ old('email') }}">
            </div>

            <div class="form-group">
                <input type="text" class="form-control" placeholder="Enter User Password" name="password">
            </div>

	</div>

	<div class="col-md-5">
		<div class="form-group">
			<label>Set Status <span class="glyphicon glyphicon-info-sign" aria-hidden="true"></span></label>
			<select name="admin" class="form-control">
				<option value="0" selected>Disabled (default)</option>
				<option value="1">Active</option>
			</select>
		</div>

		<div class="btn-group">
			<input class="btn btn-primary" type="submit" value="Submit" onclick="return validateForm()">
			<a class="btn btn-default" href="{{ redirect()->getUrlGenerator()->previous() }}">Go Back</a>
		</div>

	</div>



</form>

@stop


<script>
function validateForm() {
	console.log("VALIDATE FORM CLICKED") ;
	var task_title = document.forms["task_form"]["task_title"].value;

	if ( !task_title.length ) {
		swal("Task Title is required", "" , "warning") ;
		return false;
	}
}
</script>








