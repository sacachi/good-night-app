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

List sleep records of an user

GET: http://localhost:3000/api/v1/users/1/sleep_trackers
