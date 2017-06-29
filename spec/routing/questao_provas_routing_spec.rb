require "rails_helper"

RSpec.describe QuestaoProvasController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/questao_provas").to route_to("questao_provas#index")
    end

    it "routes to #new" do
      expect(:get => "/questao_provas/new").to route_to("questao_provas#new")
    end

    it "routes to #show" do
      expect(:get => "/questao_provas/1").to route_to("questao_provas#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/questao_provas/1/edit").to route_to("questao_provas#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/questao_provas").to route_to("questao_provas#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/questao_provas/1").to route_to("questao_provas#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/questao_provas/1").to route_to("questao_provas#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/questao_provas/1").to route_to("questao_provas#destroy", :id => "1")
    end

  end
end
