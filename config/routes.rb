# frozen_string_literal: true

Rails.application.routes.draw do
  resources :creators do 
    resources :drafts
  end

  root 'home#index'
end
