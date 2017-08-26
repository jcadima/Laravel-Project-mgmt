<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Project extends Model
{
    //
    protected $fillable = [ 
    	'project_name'
    ] ;

    // this project has many tasks - One to Many
    public function tasks() {
    	return $this->hasMany('App\Task');
    }


}
