require 'rails_helper'

RSpec.describe "MembershipTypes", type: :request do
  describe "GET /membership_types" do
    it "works! (now write some real specs)" do
      get membership_types_path
      expect(response).to have_http_status(200)
    end
  end
end
