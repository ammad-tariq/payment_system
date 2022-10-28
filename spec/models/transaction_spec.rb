# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Transaction, type: :model do
  let(:transaction) { FactoryBot.build :transaction }

  describe 'Associations' do
    it { should belong_to(:merchant).without_validating_presence }
  end

  it 'is a valid record' do
    expect(transaction).to be_valid
  end

  it 'is not valid without a uuid' do
    transaction.uuid = nil
    expect(transaction).not_to be_valid
  end

  it 'is not valid without a customer email' do
    transaction.customer_email = nil
    expect(transaction).not_to be_valid
  end

  it 'is not valid without a amount' do
    transaction.amount = 0
    expect(transaction).not_to be_valid
  end

  it 'is not valid without an merchant' do
    transaction.merchant = nil
    expect(transaction).not_to be_valid
  end

  it 'is not valid without an status' do
    transaction.status = nil
    expect(transaction).not_to be_valid
  end
end
