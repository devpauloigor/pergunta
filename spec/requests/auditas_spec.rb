require 'rails_helper'

RSpec.describe "Auditas", type: :request do
  describe "GET /auditas" do
    it "works! (now write some real specs)" do
      get auditas_path
      expect(response).to have_http_status(200)
    end
  end
end
