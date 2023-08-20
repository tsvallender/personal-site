# frozen_string_literal: true

Rails.application.routes.draw do
  default_url_options :host => "summonplayer.com"

  root "home_pages#index"

  # Users and sessions
  resources :users, only: [:new, :create, :show, :edit, :update]
  resources :sessions, only: [:new, :create]
  delete "log_out", to: "sessions#destroy_session"
  get "confirm_email", to: "email_confirmations#confirm"
end
