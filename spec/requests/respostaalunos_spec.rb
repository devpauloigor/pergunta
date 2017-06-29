require 'rails_helper'

RSpec.describe "Respostaalunos", type: :request do
  describe "GET /respostaalunos" do
    it "works! (now write some real specs)" do
      get respostaalunos_path
      expect(response).to have_http_status(200)
    end
  end
end
