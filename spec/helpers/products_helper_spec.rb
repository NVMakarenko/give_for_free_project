# frozen_string_literal: true

require 'rails_helper'
include ProductsHelper

RSpec.describe ProductsHelper, type: :helper do
  before(:each) do
    @user = FactoryBot.create(:user)
    @user2 = FactoryBot.create(:user, :second)
    @product = build(:product, owner: @user)
    @wishlist = @user2.wishlists.create(product: @product)
  end

  it 'recognize, is product in wishlist or not' do
    expect(not_in_wishlist?(@product, @user)).to eq(true)
    expect(not_in_wishlist?(@product, @user2)).to eq(false)
  end

  it 'looking for wishlists by current product' do
    expect(wishlist_by_product(@product, @user2)).to eq(@wishlist)
  end
end
