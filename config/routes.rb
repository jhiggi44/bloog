# frozen_string_literal: true

Rails.application.routes.draw do
  resources :users do
    resources :posts
  end

  root 'home#index'
end
