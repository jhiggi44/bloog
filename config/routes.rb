# frozen_string_literal: true

Rails.application.routes.draw do
  resources :users
  resources :posts
  root 'home#index'
end
