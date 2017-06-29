require "rails_helper"

RSpec.describe AuditoriasController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/auditorias").to route_to("auditorias#index")
    end

    it "routes to #new" do
      expect(:get => "/auditorias/new").to route_to("auditorias#new")
    end

    it "routes to #show" do
      expect(:get => "/auditorias/1").to route_to("auditorias#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/auditorias/1/edit").to route_to("auditorias#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/auditorias").to route_to("auditorias#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/auditorias/1").to route_to("auditorias#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/auditorias/1").to route_to("auditorias#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/auditorias/1").to route_to("auditorias#destroy", :id => "1")
    end

  end
end
