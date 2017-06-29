require 'rails_helper'

RSpec.describe "Turmas", type: :request do
  describe "GET /turmas" do
    it "works! (now write some real specs)" do
      get turmas_path
      expect(response).to have_http_status(200)
    end
  end
end
