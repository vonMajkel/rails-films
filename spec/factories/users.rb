# frozen_string_literal: true

FactoryBot.define do
  password = Faker::Internet.password(8)

  factory :random_user, class: User do
    firstname { Faker::Name.first_name }
    lastname { Faker::Name.last_name }
    nickname { Faker::Internet.username(3..15) }
    email { Faker::Internet.email }
    password { password }
    password_confirmation { password }
  end
end
