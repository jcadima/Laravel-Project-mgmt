@extends('layout')

@section('content')

<!--
<strong>Debug vars:</strong><br>
task_view->project->id :  {{ $task_view->project->id }} <br>
task_view->project->project_name: {{ $task_view->project->project_name }}  <br>
task_view->id: {{ $task_view->id }}<br>
-->


<div class="col-md-7">
    <h1>{{ $task_view->task_title }}</h1>




    <div class="form-group">
        <label>Description:</label>
        <p>{!! $task_view->task !!}</p>
    </div>
        

    <div class="btn-group">
        <a href="{{ route('task.edit', ['id' => $task_view->id ]) }}" class="btn btn-primary"> edit </a>
        <a class="btn btn-default" href="{{ redirect()->getUrlGenerator()->previous() }}">Go Back</a>
    </div>

</div>

<div class="col-md-5">

    <div class="form-group">
            <strong>Project:&nbsp;</strong>
            <span class="label label-jc">
                <a href="{{ route('task.list', [ 'projectid' => $task_view->project->id ]) }}">{{ $task_view->project->project_name }}</a>
            </span>
    </div>

    <div class="form-group">
        @if ( $task_view->priority == 0 )
            <strong>Priority: </strong><span class="label label-info">Normal</span>
        @else
            <strong>Priority: </strong><span class="label label-danger">High</span>
        @endif
    </div>

    <div class="form-group">
        @if ( $task_view->completed == 0 )
            <strong>Status:&nbsp;&nbsp;&nbsp;&nbsp;</strong><span class="label label-warning">Open</span>
        @else
            <strong>Status:&nbsp;&nbsp;&nbsp;</strong><span class="label label-success">Closed</span>
        @endif
    </div>

    <hr>

    <div class="form-group">
        <strong>Task Created: </strong><br>{{ $formatted_from }} <br>
        <strong>Due Date: </strong><br>{{ $formatted_to }}  <br>
        <hr>
        @if ( $task_view->completed != 1 )
            @if ( $is_overdue )
                <span class="label label-danger">Overdue</span>
            @else
                {{ $diff_in_days }} days left to complete this task<br>
            @endif
        @endif
    </div>

</div>


<div class="row">
    @if( count($images_set) > 0 ) 
        <div class="col-md-6">
            <h1>Images:</h1>

            <div>
                <ul id="images_col">
                @foreach ( $images_set as $image )
                    <li> 
                        <a target="_blank"href="<?php echo asset("images/$image") ?>"><img class="img-responsive" src="<?php echo asset("images/$image") ?>"></a>
                    </li>
                @endforeach
                </ul>
            </div>
        </div>
    @endif


    
    @if( count($files_set) > 0 ) 
        <div class="col-md-6">
            <h1>Files:</h1>

            <div>
                <ul id="images_col">
                @foreach ( $files_set as $file )
                    <li> 
                        <a target="_blank" href="<?php echo asset("images/$file") ; ?>">{{ $file }}</a>
                    </li>
                @endforeach
                </ul>
            </div>
        </div>
    @endif


</div>

@stop






