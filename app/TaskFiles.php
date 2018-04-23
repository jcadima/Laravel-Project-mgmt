<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class TaskFiles extends Model
{
    protected $fillable = ['task_id', 'filename'];
    
    public function task()
    {
        return $this->belongsTo('App\Task');
    }


}
