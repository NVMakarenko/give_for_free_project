# frozen_string_literal: true

class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :title
      t.text :about
      t.integer :delivery
      t.integer :state
      t.timestamps
    end
  end
end
