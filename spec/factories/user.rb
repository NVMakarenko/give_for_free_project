# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email { 'test@test.com' }
    password { '123456A' }
    password_confirmation { '123456A' }
    phone_number { '111111111' }

    trait :second do
      email { 'test22@test.com' }
      password { '123456A' }
      password_confirmation { '123456A' }
      phone_number { '222222222' }
    end
    
    trait :third do
      email { 'test33@test.com' }
      password { '123456A' }
      password_confirmation { '123456A' }
      phone_number { '333333333' }
    end
  end
end
