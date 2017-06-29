require "rails_helper"

RSpec.describe TempandosController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/tempandos").to route_to("tempandos#index")
    end

    it "routes to #new" do
      expect(:get => "/tempandos/new").to route_to("tempandos#new")
    end

    it "routes to #show" do
      expect(:get => "/tempandos/1").to route_to("tempandos#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/tempandos/1/edit").to route_to("tempandos#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/tempandos").to route_to("tempandos#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/tempandos/1").to route_to("tempandos#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/tempandos/1").to route_to("tempandos#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/tempandos/1").to route_to("tempandos#destroy", :id => "1")
    end

  end
end
