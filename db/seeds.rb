# frozen_string_literal: true

file = File.join(Rails.root, 'db', 'seeds', 'testdata.csv')
csv_text = File.read(file)
csv = CSV.parse(csv_text, headers: true)
csv.each do |row|
  Merchant.create!(row.to_hash)
end

# # generate 100 Transaction
(1..20).each do |_id|
  ChargeTransaction.create!(
    uuid: Faker::Number.number(digits: 5),
    customer_email: Faker::Internet.email,
    amount: Faker::Number.number(digits: 4),
    status: %w[Approved Reversed Refunded Error].sample,
    customer_phone: Faker::PhoneNumber.cell_phone,
    merchant_id: Merchant.where(status: 'Active').pluck(:id).sample
  )
  ReversalTransaction.create!(
    uuid: Faker::Number.number(digits: 5),
    customer_email: Faker::Internet.email,
    amount: Faker::Number.number(digits: 4),
    status: %w[Approved Reversed Refunded Error].sample,
    customer_phone: Faker::PhoneNumber.cell_phone,
    merchant_id: Merchant.where(status: 'Active').pluck(:id).sample
  )
  AuthorizeTransaction.create!(
    uuid: Faker::Number.number(digits: 5),
    customer_email: Faker::Internet.email,
    amount: Faker::Number.number(digits: 4),
    status: %w[Approved Reversed Refunded Error].sample,
    customer_phone: Faker::PhoneNumber.cell_phone,
    merchant_id: Merchant.where(status: 'Active').pluck(:id).sample
  )
  RefundTransaction.create!(
    uuid: Faker::Number.number(digits: 5),
    customer_email: Faker::Internet.email,
    amount: Faker::Number.number(digits: 4),
    status: %w[Approved Reversed Refunded Error].sample,
    customer_phone: Faker::PhoneNumber.cell_phone,
    merchant_id: Merchant.where(status: 'Active').pluck(:id).sample
  )
end
