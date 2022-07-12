# frozen_string_literal: true

class User < ApplicationRecord
  extend Devise::Models
  validates :phone_number, presence: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :offers, class_name: 'Product', foreign_key: 'owner_id'
end
