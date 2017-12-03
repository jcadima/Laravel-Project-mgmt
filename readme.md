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
git clone git@github.com:jcadima/Laravel-Project-mgmt.git
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
127.0.0.1  laraproject.dev
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
  ServerName laraproject.dev    
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
http://laraproject.dev
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
* [ ] Clean filenames before uploading: blank spaces, dots

### Screenshots

![alt LoginDemo](http://juancadima.com/wp-content/uploads/login.jpg)
<br/>
![alt AllTasks](http://juancadima.com/wp-content/uploads/alltasks.jpg)
<br/>
![alt CreateTask](http://juancadima.com/wp-content/uploads/createtask.jpg)
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