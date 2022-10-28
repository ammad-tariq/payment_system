# frozen_string_literal: true

Rails.application.routes.draw do
  resources :merchants, except: %i[new create] do
    post 'api_request'
  end

  resources :transactions, only: [:index]
  root 'transactions#index'
end
