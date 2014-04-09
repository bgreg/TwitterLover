require 'spec_helper'
describe "appearance of new_search page" do 
  it "should have text 'welcome to twitter lover, where you can meet other twitter lovers near you'" do
    visit '/searches/new'
    page.should have_content('welcome to twitter lover, where you can meet other twitter lovers near you')
  end
end
