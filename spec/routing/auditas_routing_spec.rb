require "rails_helper"

RSpec.describe AuditasController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/auditas").to route_to("auditas#index")
    end

    it "routes to #new" do
      expect(:get => "/auditas/new").to route_to("auditas#new")
    end

    it "routes to #show" do
      expect(:get => "/auditas/1").to route_to("auditas#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/auditas/1/edit").to route_to("auditas#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/auditas").to route_to("auditas#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/auditas/1").to route_to("auditas#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/auditas/1").to route_to("auditas#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/auditas/1").to route_to("auditas#destroy", :id => "1")
    end

  end
end
