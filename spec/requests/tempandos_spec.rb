require 'rails_helper'

RSpec.describe "Tempandos", type: :request do
  describe "GET /tempandos" do
    it "works! (now write some real specs)" do
      get tempandos_path
      expect(response).to have_http_status(200)
    end
  end
end
