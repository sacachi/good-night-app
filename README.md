# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version: 2.7.1

* System dependencies: postgresql, kaminari for paginate, jbuilder, rails 6 api

* To start

rails db:create

rails db:migrate

rails db:seed

rails s -p 3000

List all users with their sleep records:

GET: http://localhost:3000/api/v1/users

POST	/api/v1/users/:id/follow
    	params: followed_id

POST	/api/v1/users/:id/unfollow
    	params: followed_id

POST	/api/v1/users/:id/track_sleep
			params: user_id, sleep_time, waking_time

GET   /api/v1/users/:id/following_users

GET	  /api/v1/users/:id/followed_users
