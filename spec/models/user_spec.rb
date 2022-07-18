# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is valid with factory' do
    expect(build(:user)).to be_valid
  end
  it 'is invalid without email' do
    user = build(:user, email: nil)
    user.valid?
    expect(user.errors[:email]).to include("can't be blank")
  end

  it 'is invalid without a password' do
    user = build(:user, password: nil)
    user.valid?
    expect(user.errors[:password]).to include("can't be blank")
  end

  it 'is invalid with a password of less than 6' do
    user = build(:user, password: 'pas')
    user.valid?
    expect(user.errors[:password]).to include('is too short (minimum is 6 characters)')
  end
end
