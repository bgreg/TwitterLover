class SearchesController < ApplicationController
  def new
  end

  def tweet_search_results
    lat, long, rad = get_search

    @my_tweets = Tweet.within_circle( geo_coordinates: [[lat,long],rad]).order_by(created_at: :dec).page params[:page]

    @tweet_locations = []
    @my_tweets.each do |t|
      @tweet_locations << [t.geo_coordinates[0],t.geo_coordinates[1]]
    end
    render tweet_search_results_searches_path
  end
private
  def get_search
    return params[:lat].to_i, params[:long].to_i, params[:rad].to_i
  end
end
