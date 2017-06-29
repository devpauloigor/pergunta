require "rails_helper"

RSpec.describe UseresController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/useres").to route_to("useres#index")
    end

    it "routes to #new" do
      expect(:get => "/useres/new").to route_to("useres#new")
    end

    it "routes to #show" do
      expect(:get => "/useres/1").to route_to("useres#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/useres/1/edit").to route_to("useres#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/useres").to route_to("useres#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/useres/1").to route_to("useres#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/useres/1").to route_to("useres#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/useres/1").to route_to("useres#destroy", :id => "1")
    end

  end
end
