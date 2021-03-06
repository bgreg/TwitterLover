require "spec_helper"

describe SearchesController do
  describe "standard routing" do 
    it "routes to #index" do
      get("/searches").should route_to("searches#index")
    end

    it "routes to #new" do
      get("/searches/new").should route_to("searches#new")
    end

    it "routes to #show" do
      get("/searches/1").should route_to("searches#show", id: "1")
    end

    it "routes to #edit" do
      get("/searches/1/edit").should route_to("searches#edit",id: "1")
    end

    it "routes to #create" do
      post("/searches").should route_to("searches#create")
    end

    it "routes to #update" do
      put("/searches/1").should route_to("searches#update", id: "1")
    end

    it "routes to #destroy" do
      delete("/searches/1").should route_to("searches#destroy", id: "1")
    end

    it "routes to #find_me_friends" do
      get("/searches/tweet_search_results").should route_to("searches#tweet_search_results")
    end
  end
end
