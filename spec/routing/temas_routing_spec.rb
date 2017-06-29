require "rails_helper"

RSpec.describe TemasController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/temas").to route_to("temas#index")
    end

    it "routes to #new" do
      expect(:get => "/temas/new").to route_to("temas#new")
    end

    it "routes to #show" do
      expect(:get => "/temas/1").to route_to("temas#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/temas/1/edit").to route_to("temas#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/temas").to route_to("temas#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/temas/1").to route_to("temas#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/temas/1").to route_to("temas#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/temas/1").to route_to("temas#destroy", :id => "1")
    end

  end
end
