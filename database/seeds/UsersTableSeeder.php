<?php

use Illuminate\Database\Seeder;

class UsersTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        // admin user has admin value of 1, all others default to 0
        // store the user in a variable
        $user = App\User::create([
            'name'     => 'Demo User',
            'email'    => 'demo@test.com',
            'password' => bcrypt('demo2017') ,
            'admin'    => 1
        ]);

    }
}
