class SearchesController < ApplicationController
  def new
  end

  def tweet_search_results
    lat  = params[:lat].to_i
    long = params[:long].to_i
    rad  = params[:rad].to_i

    @my_tweets = Tweet.within_circle( geo_coordinates: [[lat,long],rad]).page params[:page]

    if @my_tweets
      message = { notice: "query accepted" }
    else
      message = { notice: "no tweets found" }
    end
    render tweet_search_results_searches_path, message and return
  end
end
