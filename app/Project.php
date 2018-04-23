<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Project extends Model
{
    //
    protected $fillable = [ 
    	'project_name'
    ] ;


    public function tasks() {
    	return $this->hasMany('App\Task');
    }


}
