# frozen_string_literal: true

FactoryBot.define do
  factory :merchant do
    name { Faker::Name.unique.name }
    description { Faker::Lorem.words(number: rand(2..10)).join(' ') }
    email { Faker::Internet.email }
    status { 'Active' }
    role { %w[Admin Merchant].sample }
    total_transaction_sum { rand(200..10_000) }
  end
end
