# frozen_string_literal: true

Rails.application.routes.draw do
  default_url_options :host => "tsvallender.co.uk"

  root "home_pages#index"
  get "μposts", to: "microposts#index"

  # Users and sessions
  resources :users, only: [:new, :create, :show, :edit, :update]
  resources :sessions, only: [:index, :new, :create]
  delete "log_out", to: "sessions#destroy_session"
  get "confirm_email", to: "email_confirmations#confirm"

  resources :blog_posts
  resources :learning_goals
  resources :microposts
  resources :tags, only: [:index, :show]
  resources :diary_entries, except: [:destroy]

  get "up" => "rails/health#show", as: :rails_health_check
end
