######heroku deployment: http://fast-ravine-1177.herokuapp.com/

OSX
---
    brew install mongodb --with-openssl

 -  To have launchd start mongodb at login:`ln -sfv /usr/local/opt/mongodb/*.plist ~/Library/LaunchAgents`
 -  Then to load mongodb now: `launchctl load ~/Library/LaunchAgents/homebrew.mxcl.mongodb.plist`

Commands used for initial rails install 
---------------------------------
    rails new TwitterLover  --skip-active-record --skip-test-unit`
    rails g foundation:install  ( like twitter bootstrap for rails )
    rails g mongoid:config 
    rails g rspec:install
    heroku addons:add mongolab:starter
    heroku addons:open mongolab 
    rake db:mongoid:create_indexes
    

Heroku startup
--------------
 -  download heroku toolbelt for osx
 -  follow:  https://toolbelt.heroku.com/osx
 -  mongolab: Use `heroku addons:docs mongolab` to view documentation.

TODO
----

 -  look at implementing google maps to display tweet locations

Example geo searches
--------------------
Tweet.within_circle( location: [center,radius]) 
    Tweet.within_circle( location: [[1,1],100]).each{ |t| puts t.inspect}
Tweet.geo_near(center).max_distance(radius)
    Tweet.geo_near( [1,3]).max_distance(10).each{ |t| puts t.inspect}
