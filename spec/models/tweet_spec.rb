require 'spec_helper'

describe Tweet do
  # sanity check
  it "should be able to instatiate a tweet object" do
    tweet = Tweet.new
    tweet.should be_an_instance_of( Tweet )
  end

  it { should validate_presence_of(:user_name) }
  it { should validate_presence_of(:geo_coordinates) }
  it { should validate_presence_of(:text) }
  it { should have_index_for(geo_coordinates: '2d')}

  it { should have_field(:user_name).of_type(String)}
  it { should have_field(:geo_coordinates).of_type(Array)}
  it { should have_field(:text).of_type(String)}
end
