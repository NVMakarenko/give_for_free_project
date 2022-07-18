# frozen_string_literal: true

class AddUserToProducts < ActiveRecord::Migration[7.0]
  def change
    add_reference :products, :owner, class: 'User'
  end
end
