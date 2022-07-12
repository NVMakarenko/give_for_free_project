# frozen_string_literal: true

class Product < ApplicationRecord
  validates :title, :delivery, :state, presence: true

  belongs_to :owner, class_name: 'User'
  has_one_attached :image do |attachable|
    attachable.variant :thumb, resize_to_limit: [100, 100]
  end

  enum :delivery, { hand: 0, post: 1 }
  enum :state, { free: 0, change: 1 }

  def own?(user)
    owner_id == user.id
  end
end
