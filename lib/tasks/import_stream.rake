namespace :import do
  desc "Importing tweets from twitter streaming api into local db"
  task :stream => :environment do
    puts "Hello start"
      import_tweets
    puts "Hello finish"
  end
end

  def import_tweets
    TweetStream.configure do |config|
      config.consumer_key       = '3GtoyQKKkuCu5dOJXy7wEUW27'
      config.consumer_secret    = 'U4gyU8ATi8UrKGJc6mJq5wEZEBtCssni4Uym0AZOlfckalLUra'
      config.oauth_token        = '1012371834-eIcrn59ZMPN51vQtrghROSGJrdplKP9rgSr8mgU'
      config.oauth_token_secret = '1L1bSwpWTIM9DMUNLREawG5n5CtjpB6bJzo0G8pChyGks'
      config.auth_method        = :oauth
    end

    EM.synchrony do
      client = TweetStream::Client.new
      Signal.trap("INT"){   client.stop }
      Signal.trap("TERM"){  client.stop }

      client.on_error do |error|
        puts error.inspect
      end

      client.sample do |status,c|

        Tweet.create( user_name: status.user.name.to_s,
                      geo_corrdinates: status.geo.coordinates,
                      text: status.text.to_s )
        puts Tweet.count

        if status.geo.kind_of? Twitter::Geo::Point
          puts status.geo.coordinates.to_s
          puts status.user.name.to_s
          puts status.text.to_s
        end
      end
    end
end

