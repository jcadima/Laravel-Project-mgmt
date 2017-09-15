@extends('layout')

@section('content')

<div class="row">
    <div class="col-md-12">
        <h1>USERS</h1>
    </div>
</div>

<table class="table table-striped">
    <thead>
      <tr>
        <th>Name</th>
        <th>Email</th>
        <th>Status</th>
        <th>Actions</th>
      </tr>
    </thead>

@if ( !$users->isEmpty() ) 
    <tbody>
    @foreach ( $users as $user)
    @if ( $user->id == 0 )  @continue 
    @endif
      <tr>
        <td><a href="{{ route('task.list', ['id'=> $user->id] ) }}">{{ $user->name }}</a></td>

        <td>{{ $user->email }}</td>
    
        <td>
            @if ( !$user->admin )
                <a href="{{ route('user.activate', ['id' => $user->id]) }}" class="btn btn-warning"> Activate User</a>
            @else
                <a href="{{ route('user.disable', ['id' => $user->id]) }}" class="btn btn-warning"> Disable User</a>
                <span class="label label-success">Active</span>
            @endif
        </td>
        <td>
            <a href="{{ route('user.edit', ['id' => $user->id]) }}" class="btn btn-primary"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span></a>
 
            <a href="{{ route('user.delete', ['id' => $user->id]) }}" class="btn btn-danger" Onclick="return ConfirmDelete();"><span class="glyphicon glyphicon-trash" aria-hidden="true"></span></a>

        </td>
      </tr>

    @endforeach
    </tbody>
@else 
    <p><em>There are no users yet</em></p>
@endif


</table>



@stop

<script>

function ConfirmDelete()
{
  var x = confirm("Are you sure? Deleting a User will also delete all tasks associated.");
  if (x)
      return true;
  else
    return false;
}




</script>  


