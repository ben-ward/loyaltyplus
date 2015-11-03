require "rails_helper"

RSpec.describe ActivitiesController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/activities").to route_to("activities#index")
    end

    it "routes to #create" do
      expect(:post => "/activities").to route_to("activities#create")
    end

    it "routes to #destroy" do
      expect(:delete => "/activities/1").to route_to("activities#destroy", :id => "1")
    end

    it "routes to #redeem" do
      expect(:post => "/redeem").to route_to("activities#redeem")
    end

  end
end
