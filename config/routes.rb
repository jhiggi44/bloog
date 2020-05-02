# frozen_string_literal: true

Rails.application.routes.draw do
  resources :creators do 
    resources :posts
  end

  root 'home#index'
end
