require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  include Devise::Test::ControllerHelpers
  let(:user) { create(:user)}

  before do
    @request.env["devise.mapping"] = Devise.mappings[:admin]
    sign_in user
  end

  describe "show" do
    it "returns http success" do
      get :show, params: {id: user.id}
      expect(response).to have_http_status(:success)
    end

    it "should have a user" do
      get :show, params: {id: user.id}
      expect(user).to eq(@controller.current_user)
    end
  end
end
