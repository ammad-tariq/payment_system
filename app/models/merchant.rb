# frozen_string_literal: true

class Merchant < ApplicationRecord
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates_uniqueness_of :email
  has_many :transactions
  validates_presence_of :status
  validates_presence_of :role
  validates_presence_of :name

  enum status: {
    Active: 0,
    Inactive: 1
  }
  enum role: {
    Merchant: 0,
    Admin: 1
  }
end
