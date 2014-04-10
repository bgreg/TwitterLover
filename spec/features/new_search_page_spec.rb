# For debugging: save_and_open_page

require 'spec_helper'
describe "appearance of new_search page" do 
  before do
    visit '/searches/new'
  end
  it "should have text 'welcome to twitter lover, where you can meet other twitter lovers near you'" do
    page.should have_content('welcome to twitter lover, where you can meet other twitter lovers near you')
  end

  it "should hvae a label for long" do 
    page.should have_content( 'Longitude' )
  end
  it "should display a text box for entering logitude of your current location" do
    page.should have_css( 'input#long')
  end

  it "should hvae a label for lat" do 
    page.should have_content( 'Latitude' )
  end
  it "should display a text box for entering logitude of your current location" do
    page.should have_css( 'input#lat')
  end

  it "should display have a submit button" do
    page.should have_css( 'input#submit')
  end

  it "should tell the user what to do" do
    page.should have_content("Enter your location, and a radius and I will give you tweets in that circle")
  end

  it "should have a row" do
    page.should have_css( 'div.row')
  end

end
