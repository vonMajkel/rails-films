# frozen_string_literal: true

FactoryBot.define do
  factory :genre do
    name { Faker::Lorem.words(1).join }
  end
end
