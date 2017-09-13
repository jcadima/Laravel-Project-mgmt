@extends('layout')

@section('content')

@include('includes.errors') 

<form id="project_form" action="{{ route('project.update', [ 'id' => $edit_project->id ]) }}" method="POST">
    {{ csrf_field() }}

<label>Edit Project <span class="glyphicon glyphicon-edit" aria-hidden="true"></span></label>

<div class="row">
    <div class="col-md-8">
		<div class="form-group">
			<input type="text" class="form-control" id="project" name="name" value="{{ $edit_project->project_name }}">
		</div>
	</div>


	<div class="col-md-4">
		<div class="btn-group">
			<input class="btn btn-primary" type="submit" value="Submit" onclick="return validateForm()">
			<a class="btn btn-default" href="{{ redirect()->getUrlGenerator()->previous() }}">Cancel</a>
		</div>
	</div>
</div>

</form>

@stop


