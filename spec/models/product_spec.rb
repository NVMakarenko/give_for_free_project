# frozen_string_literal: true

require 'rails_helper'
include ProductsHelper

RSpec.describe Product, type: :model do
  it 'is valid with factory' do
    @product = build(:product)
    expect(@product).to be_valid
  end

  it 'is invalid without title' do
    @product = build(:product, title: nil)
    @product.valid?
    expect(@product.errors[:title]).to include("can't be blank")
  end
end
