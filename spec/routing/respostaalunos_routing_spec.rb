require "rails_helper"

RSpec.describe RespostaalunosController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/respostaalunos").to route_to("respostaalunos#index")
    end

    it "routes to #new" do
      expect(:get => "/respostaalunos/new").to route_to("respostaalunos#new")
    end

    it "routes to #show" do
      expect(:get => "/respostaalunos/1").to route_to("respostaalunos#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/respostaalunos/1/edit").to route_to("respostaalunos#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/respostaalunos").to route_to("respostaalunos#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/respostaalunos/1").to route_to("respostaalunos#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/respostaalunos/1").to route_to("respostaalunos#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/respostaalunos/1").to route_to("respostaalunos#destroy", :id => "1")
    end

  end
end
