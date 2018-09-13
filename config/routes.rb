# frozen_string_literal: true

Rails.application.routes.draw do
  
  resources :posts
  resources :topics
  
  get 'welcome/index'
  get 'welcome/about'
  get 'welcome/contact'
  get 'welcome/faq'
  get 'about' => 'welcome#about'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'
end
