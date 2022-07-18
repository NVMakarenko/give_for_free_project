# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email { 'testfactory@test.com' }
    password { '123456A' }
    password_confirmation { '123456A' }
    phone_number { '111111111' }
  end
end
