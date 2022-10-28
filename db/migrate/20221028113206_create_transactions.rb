# frozen_string_literal: true

class CreateTransactions < ActiveRecord::Migration[6.1]
  def change
    create_table :transactions do |t|
      t.string :uuid
      t.integer :amount
      t.integer :status
      t.string :customer_email
      t.string :customer_phone
      t.string :type
      t.references :merchant, foreign_key: true

      t.timestamps
    end
  end
end
