# frozen_string_literal: true

namespace :merchant do
  require 'csv'

  desc 'Create Merchant and Admin from CSV'
  task create_merchant_and_admin_from_csv: :environment do
    file = File.join(Rails.root, 'db', 'seeds', 'testdata.csv')
    csv_text = File.read(file)
    csv = CSV.parse(csv_text, headers: true)
    csv.each do |row|
      Merchant.create!(row.to_hash)
    end
  end
end
