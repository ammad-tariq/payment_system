# frozen_string_literal: true

class Transaction < ApplicationRecord
  validates_presence_of :uuid
  validates_uniqueness_of :uuid
  validates :customer_email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates_presence_of :customer_email
  validates_numericality_of :amount, greater_than: 0
  validates_presence_of :status
  belongs_to :merchant, class_name: 'Merchant', foreign_key: 'merchant_id'
  validate :merchant_is_active
  enum status: {
    Approved: 0,
    Reversed: 1,
    Refunded: 2,
    Error: 3
  }

  private

  def merchant_is_active
    errors.add(:base, message: 'Merchant is Inactive') if merchant.present? && merchant.status == 'Inactive'
  end
end
