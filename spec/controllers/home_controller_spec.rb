require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  it "returns a 200 response" do
    get :index
    expect(response).to have_http_status "200"
  end

  context "as an authenticated user" do
    before do
      @user = FactoryBot.create(:user)
      sign_in @user
    end

    it "responds successfully" do
      get :index
      expect(response).to have_http_status "200"
    end
  end
end