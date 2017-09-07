require 'rails_helper'

RSpec.describe Identity, type: :model do
  let(:user) { create(:user) }
  let(:identity) { create(:google_identity, user: user) }

  it { should belong_to(:user) }
  it { should validate_presence_of(:uid) }
  it { should validate_presence_of(:provider)}

  describe "attributes" do
    it "should respond to uid" do
      expect(identity).to respond_to(:uid)
    end

    it "should respond to provider" do
      expect(identity).to respond_to(:provider)
    end
  end
end
