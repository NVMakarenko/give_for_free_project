# frozen_string_literal: true

class Product < ApplicationRecord
  validates :title, :delivery, :state, presence: true
  has_one_attached :image do |attachable|
    attachable.variant :thumb, resize_to_limit: [100, 100]
  end

  enum :delivery, { hand: 0, post: 1 }
  enum :state, { free: 0, change: 1 }
end
