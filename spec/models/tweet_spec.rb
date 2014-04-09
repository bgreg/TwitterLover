require 'spec_helper'

describe Tweet do
  it "should be able to instatiate a tweet object" do
    tweet = Tweet.new
    tweet.should be_an_instance_of( Tweet )
  end

  it "should import 2 objects from a stream" do
    objects = Tweet.import(2)
    objects.count.should eq(2)
  end
end
