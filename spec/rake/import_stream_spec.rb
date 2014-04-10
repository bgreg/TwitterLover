require 'spec_helper'
require 'rake'

describe 'import:' do 
  describe 'take' do
    before{ TwitterLover::Application.load_tasks }
    it "should have enviroment as a prerequisite" do
      Rake::Task['import:take'].prerequisites.should include("environment")
    end

    it "should change the Tweet count by 10" do
      count = Tweet.count
      Rake::Task['import:take'].invoke
      Tweet.count.should > count 
    end
  end

  describe 'stream' do
    before{ TwitterLover::Application.load_tasks }
    it "should have enviroment as a prerequisite" do
      Rake::Task['import:stream'].prerequisites.should include("environment")
    end

    it "should auth and start saving records under streaming mode in under 20 seconds" do
      count = Tweet.count
      rake_thread = Thread.new{
        Rake::Task['import:stream'].invoke
      }
      sleep(20)
      Thread.kill(rake_thread)
      Tweet.count.should > count
    end
  end
end
