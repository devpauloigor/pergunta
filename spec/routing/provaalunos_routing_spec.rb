require "rails_helper"

RSpec.describe ProvaalunosController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/provaalunos").to route_to("provaalunos#index")
    end

    it "routes to #new" do
      expect(:get => "/provaalunos/new").to route_to("provaalunos#new")
    end

    it "routes to #show" do
      expect(:get => "/provaalunos/1").to route_to("provaalunos#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/provaalunos/1/edit").to route_to("provaalunos#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/provaalunos").to route_to("provaalunos#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/provaalunos/1").to route_to("provaalunos#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/provaalunos/1").to route_to("provaalunos#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/provaalunos/1").to route_to("provaalunos#destroy", :id => "1")
    end

  end
end
