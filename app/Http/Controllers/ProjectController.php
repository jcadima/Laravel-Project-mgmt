<?php

namespace App\Http\Controllers;

use Session;
use Illuminate\Http\Request;
use App\Project;
use App\Task;


class ProjectController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */ 
    public function index()
    {
        // $tasks = Task::
        $projects = Project::all() ;
        return view('project.projects')->with('projects', $projects) ;
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        // $proje
        return view('project.create') ;
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        // dd( $request->all()  ) ;
        $this->validate( $request, [
            'project' => 'required'
        ] ) ;        

        $project_new = new Project;
        $project_new->project_name = $request->project;
        $project_new->save() ;
        Session::flash('success', 'Project Created') ;
        return redirect()->route('project.show') ;
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        // Session::flash('success', 'Project was deleted') ;
    }

    // does not work see  /app/Http/Controllers/Auth/LoginController.php
    // public function logout () {
    //     //logout user
    //     auth()->logout();
    //     // redirect to homepage or login
    //     return redirect('/login');
    // }


}
