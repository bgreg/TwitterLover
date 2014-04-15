require 'spec_helper'

describe "results" do 
  describe "form" do
    before{ visit '/searches/tweet_search_results?lat=1&long=1&page=2&rad=200' }

    it "with max radius it should show me a next page links", js: true do
      page.should have_content("Next")
    end

    it "should have a title", js: true do 
      page.should have_content("Results")
    end

    it "should respond to next page" do 
      click_link "Next"
      page.should have_content("Results")
    end
    it "should respond page 1 number click" do 
      click_link "1"
      page.should have_content("Results")
    end
    it "should respond page 2 number click" do 
      click_link "4"
      page.should have_content("Results")
    end
    it "should have a google map div" do 
      page.should have_css('div#map-canvas')
    end
  end

end
