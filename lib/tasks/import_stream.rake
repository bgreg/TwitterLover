class ImportTweets
  attr_accessor :tweet_limit
  attr_accessor :tweets

  def initialize
    @tweets = 0
    @client = TweetStream::Client.new
    #
    # tweetstream client callbacks
    #
    @client.on_delete{|status_id,user_id| }
    @client.on_error{|error| puts error.to_s }
    @client.on_limit{|skip_count|  }
  end

  def start
    EM.synchrony do
      Signal.trap( "INT" ){ @client.stop }
      Signal.trap( "TERM" ){ @client.stop }

      @client.sample do |status,c|
        if status.geo.kind_of? Twitter::Geo::Point
          tweet = Tweet.new( user_name: status.user.name.to_s,
                             geo_coordinates: status.geo.coordinates.dup,
                             text: status.text.to_s,
                             post_id: status.id.to_i,
                             created_at: status.created_at )
          @tweets += 1 if tweet.save
        end
        @client.stop if @tweet_limit && @tweets >= @tweet_limit 
      end

    end
  end

end

namespace :import do
  desc "Importing tweets from twitter streaming api into local db"
  task :stream => :environment do
    import = ImportTweets.new
    import.start
  end

  desc "Take Sample Batch of 10 tweets"
  task :take => :environment do
    import = ImportTweets.new
    import.tweet_limit = 10
    import.start
  end
end
