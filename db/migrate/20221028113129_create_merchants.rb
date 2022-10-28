# frozen_string_literal: true

class CreateMerchants < ActiveRecord::Migration[6.1]
  def change
    create_table :merchants do |t|
      t.string :name
      t.string :description
      t.string :email
      t.integer :status
      t.integer :role
      t.integer :total_transaction_sum

      t.timestamps
    end
  end
end
