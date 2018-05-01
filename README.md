# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

curl -X POST -H 'Content-Type:application/json' -d '{ "member_id": "00000001", "password": "12345678", "name": "山田　太郎", "email": "yamada@gmail.com", "sex": "1", "point": 1234, "rank": "first" }' http://0.0.0.0:3000/members
