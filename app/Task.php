<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Task extends Model
{
    protected $fillable = [ 
    	'project_id','user_id', 'task_title', 'task' , 'priority', 'duedate'
     ] ;

     
     public function project() {

     	return $this->belongsTo('App\Project') ;
     }

     public function user() {

         return $this->belongsTo('App\User') ;
     }

     public function taskfiles() {

         return $this->hasMany('App\TaskFiles') ;
     }

}
