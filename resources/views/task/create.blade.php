@extends('layout')

@section('content')

@include('includes.errors') 

<form id="task_form" action="{{ route('task.store') }}" method="POST" enctype="multipart/form-data">
    {{ csrf_field() }}

    <div class="col-md-8">
        <label>Create new task <span class="glyphicon glyphicon-plus" aria-hidden="true"></span></label>

        <div class="form-group">
            <input type="text" class="form-control" placeholder="Enter Task Title" name="task_title">
        </div>

		<div class="form-group">
           	<input type="file" class="form-control" name="photos[]" multiple>
       	</div>

        <div class="form-group">
            <textarea class="form-control" rows="10" id="summernote" name="task"></textarea>
        </div>
        
    </div>

    <div class="col-md-4">
        <div class="form-group">
            <label>Assign to Project <span class="glyphicon glyphicon-pushpin" aria-hidden="true"></span></label>
            <select name="project_id" class="selectpicker" data-style="btn-primary" style="width:100%;">
                @foreach( $projects as $project )
                    <option value="{{ $project->id }}">{{ $project->project_name }}</option>
                 @endforeach
            </select>
        </div>

        <div class="form-group">
            <label>Assign to: <span class="glyphicon glyphicon-user" aria-hidden="true"></span></label>
            <select id="user" name="user" class="selectpicker" data-style="btn-info" style="width:100%;">
				@foreach ( $users as $user)
					<option value="{{ $user->id }}">{{ $user->name }}</option>
				@endforeach

            </select>
        </div>

        <div class="form-group">
            <label>Select Priority <span class="glyphicon glyphicon-warning-sign" aria-hidden="true"></span></label>
            <select name="priority" class="selectpicker" data-style="btn-info" style="width:100%;">
              <option value="0">Normal</option>
              <option value="1">High</option>
            </select>
        </div>

        <div class="form-group">
            <label>Select Due Date <span class="glyphicon glyphicon-calendar" aria-hidden="true"></span></label>
            <div class='input-group date' id='datetimepicker1'>
                <input type='text' class="form-control" name="duedate">
                <span class="input-group-addon">
                <span class="glyphicon glyphicon-calendar"></span>
                </span>
            </div>
        </div>

        <div class="btn-group">
            <input class="btn btn-primary" type="submit" value="Submit" onclick="return validateForm()">
            <a class="btn btn-default" href="{{ redirect()->getUrlGenerator()->previous() }}">Go Back</a>
        </div>

    </div>



</form>

@stop


@section('styles')

    <link rel="stylesheet" href="{{ asset('css/summernote.css') }}">
    <link rel="stylesheet" href="{{ asset('css/bootstrap-datepicker.min.css') }}">

@stop


@section('scripts')
    <script src="{{ asset('js/summernote.min.js') }}"></script>  

    <script src="{{ asset('js/moment.js') }}"></script> 

    <script src="{{ asset('js/bootstrap-datepicker.min.js') }}"></script>  

    <script>
        jQuery(document).ready(function() {
            jQuery('#summernote').summernote({ height: 300});  // 300px height for summernote

            jQuery(function() {
                jQuery('#datetimepicker1').datetimepicker( {
                    defaultDate:'now',  // defaults to today
                    format: 'YYYY-MM-DD hh:mm:ss',  // YEAR-MONTH-DAY hour:minute:seconds
                    minDate:new Date()  // Disable previous dates, minimum is todays date
                });
            });
        });
    </script>

@stop


<script>
function validateForm() {
    var task = document.forms["task_form"]["task"].value;

    if ( !task.length ) {
        swal("Enter Task Description", "" , "warning") ;
        return false;
    }
}
</script>


