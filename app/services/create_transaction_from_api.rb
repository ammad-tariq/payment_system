# frozen_string_literal: true

require 'httparty'
require 'json_web_token'

class CreateTransactionFromApi
  include HTTParty

  def initialize(merchant)
    @merchant = merchant
  end

  def call(*args)
    new(*args).send_request
  end

  def send_request
    auth = JsonWebToken.encode(merchant_id: @merchant.id)
    response = nil
    # add api url here
    response = HTTParty.post('https://test.com',
                             body: @merchant.to_json,
                             headers: { 'Content-Type' => 'application/json', 'Authorization' => auth })

    token = response.header['Authorization'].split.last
    if JsonWebToken.decode(token).merchant_id == @merchant.id

      @merchant.transactions.build
      @merchant.save
    end
    if response && response.message == 'OK'
      'Api Request successfully'
    else
      'Please Add Api End Point '
    end
  end
end
