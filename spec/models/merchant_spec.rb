# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Merchant, type: :model do
  let(:merchant) { FactoryBot.build :merchant }

  describe 'Associations' do
    it { should have_many(:transactions) }
  end

  it 'is valid with valid attributes' do
    expect(merchant).to be_valid
  end

  it 'is not valid without email' do
    merchant.email = nil
    expect(merchant).to_not be_valid
  end

  it 'is not valid without role' do
    merchant.role = nil
    expect(merchant).to_not be_valid
  end

  it 'is not valid without name' do
    merchant.name = nil
    expect(merchant).to_not be_valid
  end

  it 'is not valid without status' do
    merchant.status = nil
    expect(merchant).to_not be_valid
  end
end
