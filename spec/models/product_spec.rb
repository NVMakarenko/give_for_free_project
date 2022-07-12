# frozen_string_literal: true

require 'rails_helper'
include ProductsHelper

RSpec.describe Product, type: :model do
  before(:each) do
    @user = FactoryBot.create(:user)
  end

  it 'is valid with factory' do
    @product = build(:product, owner: @user)
    expect(@product).to be_valid
  end

  it 'is invalid without title' do
    @product = build(:product, title: nil, owner: @user)
    @product.valid?
    expect(@product.errors[:title]).to include("can't be blank")
  end
end
