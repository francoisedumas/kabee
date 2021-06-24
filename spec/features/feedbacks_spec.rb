require 'rails_helper'

RSpec.feature "Feedback", type: :feature do
  describe "GET /api/v1/feedbacks.json", type: :controller do
    it "Access the API url" do
      visit '/api/v1/feedbacks.json'
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /api/v1/feedbacks.json", type: :controller do
    before do
      @user = FactoryBot.create(:user)
      sign_in @user
    end

    it "fetch the json" do
      visit '/api/v1/feedbacks.json'
      expect(response).to have_http_status(200)
      json = JSON.parse(response.body)
    end
  end
end