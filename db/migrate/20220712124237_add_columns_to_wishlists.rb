# frozen_string_literal: true

class AddColumnsToWishlists < ActiveRecord::Migration[7.0]
  def change
    add_reference :wishlists, :user
    add_reference :wishlists, :product
  end
end
