require 'rails_helper'

RSpec.describe "Useres", type: :request do
  describe "GET /useres" do
    it "works! (now write some real specs)" do
      get useres_path
      expect(response).to have_http_status(200)
    end
  end
end
