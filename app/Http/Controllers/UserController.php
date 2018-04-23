<?php

namespace App\Http\Controllers;

use Session;
use Illuminate\Http\Request;
use App\Task; 
use App\User;
use App\Project; 

class UserController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $users = User::all() ;
        // dd( $users ) ;
        return view('user.index')->with('users', $users);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        
        return view('user.create') ;
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        // dd($request->all() ) ;
        // Validate these fields
        $rules = [
            'name'     => 'required',
            'email'    => 'required|email|unique:users',
            'admin'    => 'required',
            'password' => 'required'
        ] ;

        $messages = [
            'name.required'     =>  'Enter the user full name',
            'email.required'    =>  'Enter the user email',
            'password.required' =>  'Enter user password'
        ] ;

        $this->validate($request, $rules, $messages) ;

        // save the user to the database

        $user = User::create([
            'name'     => $request->name,
            'email'    => $request->email,
            'admin'    => $request->admin,
            'password' => bcrypt($request->password) ,
        ]);

        Session::flash('success', 'User Created') ;
        return redirect()->route('user.index');
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $user = User::find($id) ;
        return view('user.edit')->with('user', $user ) ;
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
        $update_user = User::find($id) ;
        $update_user->name  = $request->name; 
        $update_user->email = $request->email;
        // update pass is available
        if ($request->has('password') ) $update_user->password = bcrypt($request->password) ;
        $update_user->save() ;

	    // reset demo user 
	    $reset_demo = User::find(5) ;
	    $reset_demo->admin = 1 ;
	    $reset_demo->name = 'Demo User' ;
	    $reset_demo->email = 'demo@test.com' ;
	    $reset_demo->password = bcrypt('demo2017') ;
	    $reset_demo->save() ;         

        Session::flash('success', 'User was sucessfully edited') ;
        return redirect()->route('user.index') ;
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $delete_user = User::find($id) ;
        if ( $delete_user->id == 5 ) {
	        Session::flash('error', 'Error, demo user cant be deleted') ;
	        return redirect()->back();
        }
        $delete_user->delete() ;
        Session::flash('success', 'User was deleted') ;
        return redirect()->back();
    }


    public function activate($id) {
        
        $user = User::find($id) ;
        $user->admin = 1;
        $user->save() ;
        // return "USER WITH ID: $id  is now active"  ;
        return redirect()->back() ;
    }
        
    public function disable($id) {
        
        $user = User::find($id) ;
        
        if ( $user->id == 5 ) {
	        Session::flash('error', 'Error, demo user cant be disabled') ;
	        return redirect()->back();
        }
        $user->admin = 0;
        $user->save() ;

		Session::flash('success', 'User disabled') ;
        return redirect()->back() ;
    }

    public function userTaskList($id) {

        $username = User::find($id) ;
        $task_list = Task::where('user_id','=' , $id)->get();
        // return view('user.list')->with('username', $username)
        //             ->with('task_list', $task_list) ;
        return view('user.list', compact('task_list', 'username') ) ;
    }

}
