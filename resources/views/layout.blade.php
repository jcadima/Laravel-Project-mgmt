<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <title>Project Task Manager - JC Web Development</title>
      <!-- Latest compiled and minified CSS -->
      <link rel="stylesheet" href="{{ asset('css/bootstrap.min.css') }}">
        <!-- Fonts -->

        <link rel="stylesheet" href="{{ asset('css/sweetalert2.min.css') }}" />

        <link rel="stylesheet" href="{{ asset('css/toastr.min.css') }}">

        <link rel="stylesheet" href="{{ asset('css/custom.css') }}">

        @yield('styles')

    </head>
    <body>
        <!-- /resources/views/layout.blade.php -->
        
        <nav id="myNavbar" class="navbar navbar-default" role="navigation">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="/">PROJECT-APP</a>
                </div>
                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav">
                        <!-- <li><a href="#">Home</a></li>  --> 

                        <li>
                            <a href="{{ route('user.index') }}"><span class="glyphicon glyphicon-user" aria-hidden="true"></span> Users</a>
                        </li>

                        <!--
                        <li class="dropdown">
                            <a href="#" data-toggle="dropdown" class="dropdown-toggle">Users <b class="caret"></b></a>
                            <ul class="dropdown-menu">
                                <li><a href="{{ route('user.index') }}"><span class="glyphicon glyphicon-user" aria-hidden="true"></span> Users</a></li>
                                <li><a href="{{ route('user.create') }}"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span> Create new User</a></li>
                            </ul>
                        </li>
                        -->
                                                            

                        <li>
                            <a href="{{ route('project.show') }}"><span class="glyphicon glyphicon-list" aria-hidden="true"></span> Projects</a>
                        </li>

                        <!--
                        <li class="dropdown">
                            <a href="#" data-toggle="dropdown" class="dropdown-toggle">Projects <b class="caret"></b></a>
                            <ul class="dropdown-menu">
                                <li><a href="{{ route('project.show') }}"><span class="glyphicon glyphicon-list" aria-hidden="true"></span> All Projects</a></li>
                                <li><a href="{{ route('project.create') }}"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span> Create new Project</a></li>
                            </ul>
                        </li>
                        -->


                        <li class="dropdown">
                            <a href="#" data-toggle="dropdown" class="dropdown-toggle">Tasks <b class="caret"></b></a>
                            <ul class="dropdown-menu">
                                <li><a href="{{ route('task.show') }}"><span class="glyphicon glyphicon-list-alt" aria-hidden="true"></span> All Tasks</a></li>
                                <li><a href="{{ route('task.create') }}"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span> Create new Task</a></li>
                            </ul>
                        </li>


                    </ul>
                    <!-- Right Side Of Navbar -->
                    <ul class="nav navbar-nav navbar-right">
                        <!-- Authentication Links -->
                        @if (Auth::guest())
                            <li><a href="{{ route('login') }}">Login</a></li>
                            <li><a href="{{ route('register') }}">Register</a></li>
                        @else
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
                                    {{ Auth::user()->name }} <span class="caret"></span>
                                </a>

                                <ul class="dropdown-menu" role="menu">
                                    <li>
                                        <a href="{{ route('logout') }}"
                                            onclick="event.preventDefault();
                                                    document.getElementById('logout-form').submit();">
                                            Logout
                                        </a>

                                        <form id="logout-form" action="{{ route('logout') }}" method="POST" style="display: none;">
                                            {{ csrf_field() }}
                                        </form>
                                    </li>
                                </ul>
                            </li>
                        @endif
                    </ul>
                </div><!-- /.navbar-collapse -->
            </div>
        </nav>

        <section class="main-content">
        <div class="container">   
           
                @yield('content')
            
        </div>
        </section>

        <!--   FOOTER -->
       
        <div class="footer-bottom">

            <div class="container">
        
                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">

                    <div class="copyright">

                        © 2020, JC

                    </div>

                </div>

                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6 text-right">

                    <div class="design">

                        <a target="_blank" href="http://juancadima.com">Design and Development by JC</a>

                    </div>

                </div>

            </div>

        </div>
     

    </body>

<script src="{{ asset('js/jquery-3.2.1.min.js') }}"></script>

<script src="{{ asset('js/bootstrap.min.js') }}"></script>    

<script src="{{asset('js/toastr.min.js') }}"></script>

<script src="{{ asset('js/sweetalert2.min.js') }}"></script>

<script>

@if ( Session::has('success') )
    toastr.success("{{ Session::get('success') }}")
@endif

@if ( Session::has('info') )
    toastr.info("{{ Session::get('info') }}")
@endif


@if ( Session::has('error') )
    toastr.error("{{ Session::get('error') }}")
@endif

</script>

@yield('scripts')


</html>