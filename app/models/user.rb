# frozen_string_literal: true

class User < ApplicationRecord
  extend Devise::Models
  validates :phone_number, presence: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :offers, class_name: 'Product', foreign_key: 'owner_id'

  has_many :wishlists
  has_many :wishes, class_name: 'Product', through: :wishlists, source: :product
end
