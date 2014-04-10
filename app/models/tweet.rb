class Tweet
  include Mongoid::Document
  include Mongoid::Timestamps
  field :user_name, type: String
  field :geo_corrdinates, type: Array
  field :text, type: String

  

  #index( [ [:geo_corrdinates, Mongo::GEO2D] ],background: true )
end
