require 'rails_helper'

RSpec.describe LandingController, type: :controller do
  include Devise::Test::ControllerHelpers
  let(:user) { create(:user)}

  before do
    @request.env["devise.mapping"] = Devise.mappings[:admin]
    sign_in user
  end

  describe "landing page" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end
end
