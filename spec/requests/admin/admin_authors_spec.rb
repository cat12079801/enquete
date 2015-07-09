require 'rails_helper'

RSpec.describe "Admin::Authors", type: :request do
  describe "GET /admin_authors" do
    it "works! (now write some real specs)" do
      get admin_authors_path
      expect(response).to have_http_status(200)
    end
  end
end
