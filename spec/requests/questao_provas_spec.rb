require 'rails_helper'

RSpec.describe "QuestaoProvas", type: :request do
  describe "GET /questao_provas" do
    it "works! (now write some real specs)" do
      get questao_provas_path
      expect(response).to have_http_status(200)
    end
  end
end
