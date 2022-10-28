# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Transactions', type: :request do
  let(:transaction) { FactoryBot.create :transaction }

  it 'request list of all users' do
    transaction
    get '/transactions'
    expect(response).to be_successful
    expect(response.body).to include(transaction.customer_email)
  end
end
