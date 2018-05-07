# Laravel Project Task Manager

A simple task manager app built with Laravel 5.4.33
  
### Demo
[Task Management Demo](http://taskmanager.juancadima.com/)


### Demo login info:
user: demo@test.com <br/>
pass: demo2017

### How to install
1) Simply [download](https://github.com/jcadima/Laravel-Project-mgmt/archive/master.zip) or clone the repo:
```
git clone https://github.com/jcadima/Laravel-Project-mgmt.git
```

2a) Import database and modify your .env file
[Task Management DB](https://github.com/jcadima/Laravel-Project-mgmt/blob/master/project_mgmt.sql)

**NOTE**: If using MariaDB you might see an error about "key too long", to fix this open:
```
 /app/Providers/AppServiceProvider.php
```

make the following changes so that it looks like:

```php
namespace App\Providers;

use Illuminate\Support\ServiceProvider;
// Include Schema
use Illuminate\Support\Facades\Schema;

class AppServiceProvider extends ServiceProvider
{

    public function boot()
    {	// Read more about this error at:
        // https://laravel-news.com/laravel-5-4-key-too-long-error
        // Fix Laravel 5.4  utf8mb4:
        Schema::defaultStringLength(191) ;
    }

    public function register()
    {
        //
    }
}

```

OR


2b) Run the database seeder:

```
php artisan db:seed
```

The project comes with a UsersTableSedder.php class with the following:

```php
        App\User::create([
            'name' => 'Demo User',
            'email' => 'demo@test.com',
            'password' => bcrypt('demo2017') 
        ]);
```


3) open your hosts file:
```
sudo vim /etc/hosts
```
and create a new entry for your project:
```
127.0.0.1  laraproject.test
```

4) open your vhosts file to create a [Virtual host](http://juancadima.com/creating-a-virtual-host-in-xampp-linux/) for this new entry, depending on your system your **httpd-vhosts.conf** might be located in one of the following:

```
sudo vim /opt/lampp/etc/httpd.conf  OR
sudo vim /Applications/XAMPP/xamppfiles/etc/extra/httpd-vhosts.conf
```

and add at the bottom of the file

```
# LARAVEL PROJECT TASK MANAGER 
<VirtualHost *:80>
  ServerName laraproject.test    
  DocumentRoot "/Applications/XAMPP/xamppfiles/htdocs/laraproject/public"
     <Directory "/Applications/XAMPP/xamppfiles/htdocs/laraproject/public">
         Options Indexes FollowSymLinks Includes ExecCGI
         AllowOverride All
         Require all granted
      </Directory>
</VirtualHost>
```

5) restart Apache , and you will be able to load the project at the specified dev. URL above, in this case:

```
http://laraproject.test
```

### ROUTES

```
 >  php artisan route:list
+--------+--------------------------------+-----------------------------------------------------+------------------------------+---------------------------------------------------------------------------+--------------------------------------------------------------------------------------------------------------------------+
| Domain | Method                         | URI                                                 | Name                         | Action                                                     | Middleware                          |
+--------+--------------------------------+-----------------------------------------------------+------------------------------+---------------------------------------------------------------------------+--------------------------------------------------------------------------------------------------------------------------+
|        | GET|HEAD                       | /                                                   |                              | Closure                                                     | web                          |
|        | GET|HEAD                       | admin/projects                                      | project.show                 | App\Http\Controllers\ProjectController@index                              | web,auth                          |
|        | GET|HEAD                       | admin/projects/create                               | project.create               | App\Http\Controllers\ProjectController@create                             | web,auth                          |
|        | GET|HEAD                       | admin/projects/delete/{id}                          | project.delete               | App\Http\Controllers\ProjectController@destroy                            | web,auth                          |
|        | GET|HEAD                       | admin/projects/edit/{id}                            | project.edit                 | App\Http\Controllers\ProjectController@edit                               | web,auth                          |
|        | POST                           | admin/projects/store                                | project.store                | App\Http\Controllers\ProjectController@store                              | web,auth                          |
|        | POST                           | admin/projects/update/{id}                          | project.update               | App\Http\Controllers\ProjectController@update                             | web,auth                          |
|        | GET|HEAD                       | admin/tasks                                         | task.show                    | App\Http\Controllers\TaskController@index                                 | web,auth                          |
|        | GET|HEAD                       | admin/tasks/completed/{id}                          | task.completed               | App\Http\Controllers\TaskController@completed                             | web,auth                          |
|        | GET|HEAD                       | admin/tasks/create                                  | task.create                  | App\Http\Controllers\TaskController@create                                | web,auth                          |
|        | GET|HEAD                       | admin/tasks/delete/{id}                             | task.delete                  | App\Http\Controllers\TaskController@destroy                               | web,auth                          |
|        | GET|HEAD                       | admin/tasks/deletefile/{id}                         | task.deletefile              | App\Http\Controllers\TaskController@deleteFile                            | web,auth                          |
|        | GET|HEAD                       | admin/tasks/edit/{id}                               | task.edit                    | App\Http\Controllers\TaskController@edit                                  | web,auth                          |
|        | GET|HEAD                       | admin/tasks/list/{projectid}                        | task.list                    | App\Http\Controllers\TaskController@tasklist                              | web,auth                          |
|        | GET|HEAD                       | admin/tasks/search                                  | task.search                  | App\Http\Controllers\TaskController@searchTask                            | web,auth                          |
|        | GET|HEAD                       | admin/tasks/sort/{key}                              | task.sort                    | App\Http\Controllers\TaskController@sort                                  | web,auth                          |
|        | POST                           | admin/tasks/store                                   | task.store                   | App\Http\Controllers\TaskController@store                                 | web,auth                          |
|        | POST                           | admin/tasks/update/{id}                             | task.update                  | App\Http\Controllers\TaskController@update                                | web,auth                          |
|        | GET|HEAD                       | admin/tasks/view/{id}                               | task.view                    | App\Http\Controllers\TaskController@view                                  | web,auth                          |
|        | GET|HEAD                       | admin/users                                         | user.index                   | App\Http\Controllers\UserController@index                                 | web,auth                          |
|        | GET|HEAD                       | admin/users/activate/{id}                           | user.activate                | App\Http\Controllers\UserController@activate                              | web,auth                          |
|        | GET|HEAD                       | admin/users/create                                  | user.create                  | App\Http\Controllers\UserController@create                                | web,auth                          |
|        | GET|HEAD                       | admin/users/delete/{id}                             | user.delete                  | App\Http\Controllers\UserController@destroy                               | web,auth                          |
|        | GET|HEAD                       | admin/users/disable/{id}                            | user.disable                 | App\Http\Controllers\UserController@disable                               | web,auth                          |
|        | GET|HEAD                       | admin/users/edit/{id}                               | user.edit                    | App\Http\Controllers\UserController@edit                                  | web,auth                          |
|        | GET|HEAD                       | admin/users/list/{id}                               | user.list                    | App\Http\Controllers\UserController@userTaskList                          | web,auth                          |
|        | POST                           | admin/users/store                                   | user.store                   | App\Http\Controllers\UserController@store                                 | web,auth                          |
|        | POST                           | admin/users/update/{id}                             | user.update                  | App\Http\Controllers\UserController@update                                | web,auth                          |
|        | GET|HEAD                       | api/user                                            |                              | Closure                                                     | api,auth:api                          |
|        | GET|HEAD                       | laravel-filemanager                                 | unisharp.lfm.show            | \Unisharp\Laravelfilemanager\controllers\LfmController@show               | web,auth,\Unisharp\Laravelfilemanager\middlewares\MultiUser,\Unisharp\Laravelfilemanager\middlewares\CreateDefaultFolder |
|        | GET|HEAD                       | laravel-filemanager/crop                            | unisharp.lfm.getCrop         | \Unisharp\Laravelfilemanager\controllers\CropController@getCrop           | web,auth,\Unisharp\Laravelfilemanager\middlewares\MultiUser,\Unisharp\Laravelfilemanager\middlewares\CreateDefaultFolder |
|        | GET|HEAD                       | laravel-filemanager/cropimage                       | unisharp.lfm.getCropimage    | \Unisharp\Laravelfilemanager\controllers\CropController@getCropimage      | web,auth,\Unisharp\Laravelfilemanager\middlewares\MultiUser,\Unisharp\Laravelfilemanager\middlewares\CreateDefaultFolder |
|        | GET|HEAD                       | laravel-filemanager/cropnewimage                    | unisharp.lfm.getCropimage    | \Unisharp\Laravelfilemanager\controllers\CropController@getNewCropimage   | web,auth,\Unisharp\Laravelfilemanager\middlewares\MultiUser,\Unisharp\Laravelfilemanager\middlewares\CreateDefaultFolder |
|        | GET|HEAD                       | laravel-filemanager/delete                          | unisharp.lfm.getDelete       | \Unisharp\Laravelfilemanager\controllers\DeleteController@getDelete       | web,auth,\Unisharp\Laravelfilemanager\middlewares\MultiUser,\Unisharp\Laravelfilemanager\middlewares\CreateDefaultFolder |
|        | GET|HEAD                       | laravel-filemanager/deletefolder                    | unisharp.lfm.getDeletefolder | \Unisharp\Laravelfilemanager\controllers\FolderController@getDeletefolder | web,auth,\Unisharp\Laravelfilemanager\middlewares\MultiUser,\Unisharp\Laravelfilemanager\middlewares\CreateDefaultFolder |
|        | GET|HEAD                       | laravel-filemanager/doresize                        | unisharp.lfm.performResize   | \Unisharp\Laravelfilemanager\controllers\ResizeController@performResize   | web,auth,\Unisharp\Laravelfilemanager\middlewares\MultiUser,\Unisharp\Laravelfilemanager\middlewares\CreateDefaultFolder |
|        | GET|HEAD                       | laravel-filemanager/download                        | unisharp.lfm.getDownload     | \Unisharp\Laravelfilemanager\controllers\DownloadController@getDownload   | web,auth,\Unisharp\Laravelfilemanager\middlewares\MultiUser,\Unisharp\Laravelfilemanager\middlewares\CreateDefaultFolder |
|        | GET|HEAD                       | laravel-filemanager/errors                          | unisharp.lfm.getErrors       | \Unisharp\Laravelfilemanager\controllers\LfmController@getErrors          | web,auth,\Unisharp\Laravelfilemanager\middlewares\MultiUser,\Unisharp\Laravelfilemanager\middlewares\CreateDefaultFolder |
|        | GET|HEAD                       | laravel-filemanager/files/{base_path}/{file_name}   | unisharp.lfm.                | \Unisharp\Laravelfilemanager\controllers\RedirectController@getFile       |                          |
|        | GET|HEAD                       | laravel-filemanager/folders                         | unisharp.lfm.getFolders      | \Unisharp\Laravelfilemanager\controllers\FolderController@getFolders      | web,auth,\Unisharp\Laravelfilemanager\middlewares\MultiUser,\Unisharp\Laravelfilemanager\middlewares\CreateDefaultFolder |
|        | GET|HEAD                       | laravel-filemanager/jsonitems                       | unisharp.lfm.getItems        | \Unisharp\Laravelfilemanager\controllers\ItemsController@getItems         | web,auth,\Unisharp\Laravelfilemanager\middlewares\MultiUser,\Unisharp\Laravelfilemanager\middlewares\CreateDefaultFolder |
|        | GET|HEAD                       | laravel-filemanager/newfolder                       | unisharp.lfm.getAddfolder    | \Unisharp\Laravelfilemanager\controllers\FolderController@getAddfolder    | web,auth,\Unisharp\Laravelfilemanager\middlewares\MultiUser,\Unisharp\Laravelfilemanager\middlewares\CreateDefaultFolder |
|        | GET|HEAD                       | laravel-filemanager/photos/{base_path}/{image_name} | unisharp.lfm.                | \Unisharp\Laravelfilemanager\controllers\RedirectController@getImage      |                          |
|        | GET|HEAD                       | laravel-filemanager/rename                          | unisharp.lfm.getRename       | \Unisharp\Laravelfilemanager\controllers\RenameController@getRename       | web,auth,\Unisharp\Laravelfilemanager\middlewares\MultiUser,\Unisharp\Laravelfilemanager\middlewares\CreateDefaultFolder |
|        | GET|HEAD                       | laravel-filemanager/resize                          | unisharp.lfm.getResize       | \Unisharp\Laravelfilemanager\controllers\ResizeController@getResize       | web,auth,\Unisharp\Laravelfilemanager\middlewares\MultiUser,\Unisharp\Laravelfilemanager\middlewares\CreateDefaultFolder |
|        | GET|HEAD|POST|PUT|PATCH|DELETE | laravel-filemanager/upload                          | unisharp.lfm.upload          | \Unisharp\Laravelfilemanager\controllers\UploadController@upload          | web,auth,\Unisharp\Laravelfilemanager\middlewares\MultiUser,\Unisharp\Laravelfilemanager\middlewares\CreateDefaultFolder |
|        | POST                           | login                                               |                              | App\Http\Controllers\Auth\LoginController@login                           | web,guest                          |
|        | GET|HEAD                       | login                                               | login                        | App\Http\Controllers\Auth\LoginController@showLoginForm                   | web,guest                          |
|        | POST                           | logout                                              | logout                       | App\Http\Controllers\Auth\LoginController@logout                          | web                          |
|        | POST                           | password/email                                      | password.email               | App\Http\Controllers\Auth\ForgotPasswordController@sendResetLinkEmail     | web,guest                          |
|        | POST                           | password/reset                                      |                              | App\Http\Controllers\Auth\ResetPasswordController@reset                   | web,guest                          |
|        | GET|HEAD                       | password/reset                                      | password.request             | App\Http\Controllers\Auth\ForgotPasswordController@showLinkRequestForm    | web,guest                          |
|        | GET|HEAD                       | password/reset/{token}                              | password.reset               | App\Http\Controllers\Auth\ResetPasswordController@showResetForm           | web,guest                          |
|        | GET|HEAD                       | register                                            | register                     | App\Http\Controllers\Auth\RegisterController@showRegistrationForm         | web,guest                          |
|        | POST                           | register                                            |                              | App\Http\Controllers\Auth\RegisterController@register                     | web,guest                          |
+--------+--------------------------------+-----------------------------------------------------+------------------------------+---------------------------------------------------------------------------+-----------------------------------------------------------------------------------------------
```

### Database table schemas
**migrations**

```
+-----------+------------------+------+-----+---------+----------------+
| Field     | Type             | Null | Key | Default | Extra          |
+-----------+------------------+------+-----+---------+----------------+
| id        | int(10) unsigned | NO   | PRI | NULL    | auto_increment |
| migration | varchar(191)     | NO   |     | NULL    |                |
| batch     | int(11)          | NO   |     | NULL    |                |
+-----------+------------------+------+-----+---------+----------------+
```

**projects**

```
+--------------+------------------+------+-----+---------+----------------+
| Field        | Type             | Null | Key | Default | Extra          |
+--------------+------------------+------+-----+---------+----------------+
| id           | int(10) unsigned | NO   | PRI | NULL    | auto_increment |
| project_name | varchar(191)     | NO   |     | NULL    |                |
| created_at   | timestamp        | YES  |     | NULL    |                |
| updated_at   | timestamp        | YES  |     | NULL    |                |
+--------------+------------------+------+-----+---------+----------------+
```

**task_files**

```
+------------+------------------+------+-----+---------+----------------+
| Field      | Type             | Null | Key | Default | Extra          |
+------------+------------------+------+-----+---------+----------------+
| id         | int(10) unsigned | NO   | PRI | NULL    | auto_increment |
| task_id    | int(10) unsigned | NO   | MUL | NULL    |                |
| filename   | varchar(191)     | NO   |     | NULL    |                |
| created_at | timestamp        | YES  |     | NULL    |                |
| updated_at | timestamp        | YES  |     | NULL    |                |
+------------+------------------+------+-----+---------+----------------+
```

**tasks**

```
+------------+------------------+------+-----+---------+----------------+
| Field      | Type             | Null | Key | Default | Extra          |
+------------+------------------+------+-----+---------+----------------+
| id         | int(10) unsigned | NO   | PRI | NULL    | auto_increment |
| user_id    | int(10) unsigned | NO   | MUL | NULL    |                |
| project_id | int(10) unsigned | NO   | MUL | NULL    |                |
| task_title | varchar(191)     | NO   |     | NULL    |                |
| task       | text             | NO   |     | NULL    |                |
| priority   | int(11)          | NO   |     | 0       |                |
| completed  | tinyint(1)       | NO   |     | 0       |                |
| created_at | timestamp        | YES  |     | NULL    |                |
| updated_at | timestamp        | YES  |     | NULL    |                |
| duedate    | datetime         | YES  |     | NULL    |                |
+------------+------------------+------+-----+---------+----------------+
```

**users**

```
+----------------+------------------+------+-----+---------+----------------+
| Field          | Type             | Null | Key | Default | Extra          |
+----------------+------------------+------+-----+---------+----------------+
| id             | int(10) unsigned | NO   | PRI | NULL    | auto_increment |
| admin          | tinyint(1)       | NO   |     | 0       |                |
| name           | varchar(191)     | NO   |     | NULL    |                |
| email          | varchar(191)     | NO   | UNI | NULL    |                |
| password       | varchar(191)     | NO   |     | NULL    |                |
| remember_token | varchar(100)     | YES  |     | NULL    |                |
| created_at     | timestamp        | YES  |     | NULL    |                |
| updated_at     | timestamp        | YES  |     | NULL    |                |
+----------------+------------------+------+-----+---------+----------------+
```


### Todos && Features
* [X] Create Models
* [X] Create blade includes
* [X] Assign Tasks to Project
* [X] Assign Task Priority
* [X] Assign Task Status
* [X] Add Toastr Notifications
* [X] Implement Cascade down on delete
* [X] Delete associated tasks that belong to a user
* [X] Add/Edit/Delete Tasks
* [X] Sort by column
* [X] Multiple File Upload
* [X] Demo Login
* [X] Added Summernote WYSIWYG editor for Task view
* [X] Add Pagination
* [X] Restrict new user registration (Admin approval)
* [X] Add Modal box for Projects and User creation
* [X] Add lightbox to image gallery
* [X] Clean filenames before uploading: blank spaces, dots
* [X] Add FileManager package for file uploads
* [X] Add custom class options for uploaded images
* [ ] Add autocomplete search
* [ ] Nested Comment System
* [ ] Add User token confirmation Emails

### Screenshots


![alt AllTasks](http://juancadima.com/wp-content/uploads/alltasks.jpg)
<br/>
![alt CreateTask](http://juancadima.com/wp-content/uploads/filemanager.png)
<br/>
![alt ActiveProjects](http://juancadima.com/wp-content/uploads/listofactiveprojects.png)
<br/>
![alt ActiveProjects](http://juancadima.com/wp-content/uploads/newproject.png)
<br>
![alt TaskView](http://juancadima.com/wp-content/uploads/singletask.png)
<br/>
![alt TaskView](http://juancadima.com/wp-content/uploads/users.png)
<br>
![alt TaskView](http://juancadima.com/wp-content/uploads/newuser.png)