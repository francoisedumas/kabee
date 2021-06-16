require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:john) {
    User.create(
      first_name: "John",
      last_name: "Doe",
      email: "johnd@lewagon.com",
      password: "azerty"
    )
  }

  it 'is created' do
    expect(john).to be_valid
  end

  it 'can be checked for object attribute and proper values' do
    expect(john).to have_attributes(first_name: 'John', email: 'johnd@lewagon.com')
  end

	it "is invalid without a last name" do
    user = User.new(last_name: nil)
    user.valid?
    expect(user.errors[:last_name]).to include("can't be blank")
  end
end
