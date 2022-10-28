# frozen_string_literal: true

FactoryBot.define do
  factory :transaction do
    uuid { Faker::Number.number(digits: 5) }
    customer_email { Faker::Internet.email }
    status { %w[Approved Reversed Refunded Error].sample }
    customer_phone { Faker::PhoneNumber.cell_phone }
    amount { rand(2000..10_000) }
    association :merchant
    type { %w[AuthorizeTransaction ReversalTransaction ChargeTransaction RefundTransaction].sample }
  end
end
