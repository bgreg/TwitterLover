heroku deployment: http://fast-ravine-1177.herokuapp.com/

OSX
 brew install mongodb --with-openssl
 To have launchd start mongodb at login:
    ln -sfv /usr/local/opt/mongodb/*.plist ~/Library/LaunchAgents
 Then to load mongodb now:
    launchctl load ~/Library/LaunchAgents/homebrew.mxcl.mongodb.plist

Commands used initial rails setup 

 rails new TwitterLover  --skip-active-record --skip-test-unit
 rails g foundation:install  ( like twitter bootstrap for rails )
 rails g mongoid:config
 rails g rspec:install
 heroku addons:add mongolab:starter
 heroku addons:open mongolab

Heroku startup

 - download heroku toolbelt for osx
 - follow:  https://toolbelt.heroku.com/osx
 - mongolab: Use `heroku addons:docs mongolab` to view documentation.

Additional resources I found helpful
  - http://robots.thoughtbot.com/test-rake-tasks-like-a-boss
  - https://devcenter.heroku.com/articles/getting-started-with-rails3

Mongoid Rake Tasks
  db:create: Exists only for dependency purposes, does not actually do anything.
  db:create_indexes: Reads all index definitions from the models and attempts to create them in the database.
  db:remove_indexes: Reads all secondary index definitions from the models and attempts to remove indexes that are not defined.
  db:drop: Drops all collections in the database with the exception of the system collections.
  db:migrate: Exists only for dependency purposes, does not actually do anything.
  db:purge: Deletes all data, including indexes, from the database. Since 3.1.0
  db:schema:load: Exists only for framework dependency purposes, does not actually do anything.
  db:seed: Seeds the database from db/seeds.rb
  db:setup: Creates indexes and seeds the database.
  db:test:prepare: Exists only for framework dependency purposes, does not actually do anything.
