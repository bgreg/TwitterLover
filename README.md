######heroku deployment: http://fast-ravine-1177.herokuapp.com/

OSX
---
    brew install mongodb --with-openssl

 -  To have launchd start mongodb at login:`ln -sfv /usr/local/opt/mongodb/*.plist ~/Library/LaunchAgents`
 -  Then to load mongodb now: `launchctl load ~/Library/LaunchAgents/homebrew.mxcl.mongodb.plist`

Commands used initial rails setup 
---------------------------------
    rails new TwitterLover  --skip-active-record --skip-test-unit`
    rails g foundation:install  ( like twitter bootstrap for rails )
    rails g mongoid:config 
    rails g rspec:install
    heroku addons:add mongolab:starter
    heroku addons:open mongolab 

Heroku startup
--------------
 -  download heroku toolbelt for osx
 -  follow:  https://toolbelt.heroku.com/osx
 -  mongolab: Use `heroku addons:docs mongolab` to view documentation.


TODO
----
 -  Write search method in searches controller to look for tweets for a given radius in the database
 -  paginate results from search
 -  look at implementing google maps to display tweet locations
