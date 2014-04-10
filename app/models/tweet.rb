class Tweet
  include Mongoid::Document
  include Mongoid::Timestamps
  store_in collection: "tweets"

  field :user_name, type: String
  field :geo_coordinates, type: Array
  field :text, type: String

  index({ geo_coordinates: "2d"}, {min: -200, max:200})
end
