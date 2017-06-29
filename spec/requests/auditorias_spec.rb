require 'rails_helper'

RSpec.describe "Auditorias", type: :request do
  describe "GET /auditorias" do
    it "works! (now write some real specs)" do
      get auditorias_path
      expect(response).to have_http_status(200)
    end
  end
end
