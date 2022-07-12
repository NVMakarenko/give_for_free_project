# frozen_string_literal: true

FactoryBot.define do
  factory :product do
    title { 'MyString' }
    about { 'MyText' }
    delivery { 1 }
    state { 1 }
  end
end
