# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Merchants', type: :request do
  let(:merchant) { FactoryBot.create :merchant }

  it 'request list of all merchants' do
    merchant
    get '/merchants'
    expect(response).to be_successful
    expect(response.body).to include(merchant.name)
  end

  it "Update a Merchant and redirects to the Merchant's page" do
    merchant
    get "/merchants/#{merchant.id}/edit"
    expect(response).to render_template(:edit)
    patch "/merchants/#{merchant.id}", params: { merchant: { name: 'test merchant' } }
    expect(response).to redirect_to(assigns(:merchant))
    follow_redirect!
    expect(response).to render_template(:show)
    expect(response.body).to include('Merchant was successfully updated.')
  end

  it 'Delete a Merchant and redirects to the Merchants page' do
    merchant
    delete "/merchants/#{merchant.id}"
    expect(Merchant.all.count).to be 0
  end

  it 'Api Request' do
    merchant
    post "/merchants/#{merchant.id}/api_request"
    expect(response).to redirect_to(assigns(:merchant))
    follow_redirect!
    expect(response).to render_template(:show)
    expect(response).to be_successful
    expect(response.body).to include('Api Request successfully')
  end
end
