require 'rails_helper'

RSpec.describe "Provas", type: :request do
  describe "GET /provas" do
    it "works! (now write some real specs)" do
      get provas_path
      expect(response).to have_http_status(200)
    end
  end
end
