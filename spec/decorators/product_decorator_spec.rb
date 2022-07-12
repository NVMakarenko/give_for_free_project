# frozen_string_literal: true

require 'rails_helper'
require 'spec_helper'

RSpec.describe ProductDecorator do
  it 'shows proper string instead integer' do
    @product = build(:product)
    expect(@product.delivery.humanize).to eq('Post')
    expect(@product.state.humanize).to eq('Change')
  end

  it 'shows proper string instead integer' do
    @product = build(:product, delivery: 0, state: 0)
    expect(@product.delivery.humanize).to eq('Hand')
    expect(@product.state.humanize).to eq('Free')
  end
end
