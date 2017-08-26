<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Task extends Model
{
    protected $fillable = [ 
    	'task_title', 'task' , 'project_id', 'priority'
     ] ;

     // this task belongs to a Project - One to One
     public function project() {
     	return $this->belongsTo('App\Project') ;
     }

}
