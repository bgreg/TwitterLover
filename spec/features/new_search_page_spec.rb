# For debugging: save_and_open_page

require 'spec_helper'
describe "new_search page" do 
  describe "appearance" do
    before{visit '/searches/new'}

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

    it "should hvae a label for radius" do 
      page.should have_content( 'Radius' )
    end
    it "should display a text box for entering logitude of your current location" do
      page.should have_css( 'input#rad')
    end

    it "should have a row" do
      page.should have_css( 'div.row')
    end
  end

  describe "form" do
    before{visit '/searches/new'}
    it "should not accept strings in the longitude field" do 
      fill_in "lat", with: "string example"
      click_button :submit
      page.should_not have_content("query submitted")
    end

    it "should not accept strings in the longitude field" do 
      fill_in :long, with: "string example"
      click_button :submit
      page.should_not have_content("query submitted")
    end

    it "should not accept strings in the longitude field" do 
      fill_in :rad, with: "string example"
      click_button :submit
      page.should_not have_content("query submitted")
    end
  end
end
