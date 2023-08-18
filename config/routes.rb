# frozen_string_literal: true

Rails.application.routes.draw do
  root "sessions#new"

  resources :users, only: [:new, :create, :show, :edit, :update]
  resources :sessions, only: [:new, :create]
  delete "log_out", to: "sessions#destroy_session"
end
