require 'rails_helper'

RSpec.describe User, type: :model do
  it "has a valid factory" do
    expect(FactoryBot.build(:user)).to be_valid
  end

  it 'is created' do
    john = FactoryBot.build(:user)
    expect(john).to be_valid
  end

  it "is invalid without a first name" do
    user = FactoryBot.build(:user, first_name: nil)
    user.valid?
    expect(user.errors[:first_name]).to include("can't be blank")
  end

  it "is invalid without a last name" do
    user = FactoryBot.build(:user, last_name: nil)
    user.valid?
    expect(user.errors[:last_name]).to include("can't be blank")
  end

  it "is invalid without an email address" do
    user = FactoryBot.build(:user, email: nil)
    user.valid?
    expect(user.errors[:email]).to include("can't be blank")
  end

  it "is invalid with a duplicate email address" do
    FactoryBot.create(:user, email: "john@example.com")
    user = FactoryBot.build(:user, email: "john@example.com")
    user.valid?
    expect(user.errors[:email]).to include("has already been taken")
  end

  context 'new user' do
    subject(:nice) {User.create(first_name: "Brice", last_name: "Nice", password: "azerty", email: "bnice@lewagon.com")}

    it 'also has a last name' do
      expect(nice).to have_attributes(last_name: 'Nice')
    end
  end

  context 'a very new user' do
    it 'is also added to database with change' do
      expect {
        User.create(first_name: "Lorem", last_name: "Lorem", password: "azerty", email: "lorem@lewagon.com")
      }.to change { User.count }
    end
  end
end
