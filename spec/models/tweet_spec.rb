require 'spec_helper'

describe Tweet do
  it "should be able to instatiate a tweet object" do
    tweet = Tweet.new
    tweet.should be_an_instance_of( Tweet )
  end

  it { should validate_presence_of(:user_name) }
  it { should validate_presence_of(:geo_coordinates) }
  it { should validate_presence_of(:text) }
end
