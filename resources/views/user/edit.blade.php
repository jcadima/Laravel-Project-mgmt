@extends('layout')

@section('content')


<form action="{{ route('user.update', [ 'id' => $user->id ] ) }}" method="POST">
    {{ csrf_field() }}


    <div class="col-md-8">

    	<div class="form-group">
    		<label>Edit Name</label>
			<input type="text" class="form-control"  name="name" value="{{ $user->name }}">
		</div>

    	<div class="form-group">
    		<label>Edit Email</label>
			<input type="text" class="form-control"  name="email" value="{{ $user->email }}">
		</div>

		<div class="form-group">
			<input type="text" class="form-control" placeholder="Update User Password (optional)" name="password">
		</div>

	</div>

	<div class="col-md-4">

		<div class="form-group">
			<label>Edit Status <span class="glyphicon glyphicon-info-sign" aria-hidden="true"></span></label>
			<select name="completed" class="form-control">
				@if( $user->admin == 0 )
			  		<option value="0" selected>Not Active</option>
			  		<option value="1">Active</option>
			  	@else
			  		<option value="0">Not Active</option>
			  		<option value="1" selected>Active</option>
			  	@endif
			</select>
		</div>

		<div class="btn-group">
			<input class="btn btn-primary" type="submit" value="Submit">
			<a class="btn btn-default" href="{{ redirect()->getUrlGenerator()->previous() }}">Go Back</a>
		</div>

	</div>




</form>

@stop

