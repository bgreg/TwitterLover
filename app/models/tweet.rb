class Tweet
  include Mongoid::Document
  field :user_name, type: String
  field :geo_corrdinates, type: String
  field :text, type: String


  def self.import(tweet_count)
    TweetStream.configure do |config|
      config.consumer_key       = '3GtoyQKKkuCu5dOJXy7wEUW27'
      config.consumer_secret    = 'U4gyU8ATi8UrKGJc6mJq5wEZEBtCssni4Uym0AZOlfckalLUra'
      config.oauth_token        = '1012371834-eIcrn59ZMPN51vQtrghROSGJrdplKP9rgSr8mgU'
      config.oauth_token_secret = '1L1bSwpWTIM9DMUNLREawG5n5CtjpB6bJzo0G8pChyGks'
      config.auth_method        = :oauth
    end
    # This will pull a sample of all tweets based on
    # your Twitter account's Streaming API role.
    statuses = []
    TweetStream::Client.new.sample do |status,client|
      # The status object is a special Hash with
      # method access to its keys.
      Signal.trap("INT"){ client.stop}
      Signal.trap("TERM"){ client.stop}
      if status.geo.kind_of? Twitter::Geo::Point
        puts status.geo.inspect
        puts status.user.name.inspect
        puts status.text.inspect
        statuses << status.geo.inspect
      end
      client.stop if statuses.size >= tweet_count
    end
    statuses
  end
end
