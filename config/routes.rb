# frozen_string_literal: true

Rails.application.routes.draw do
  resources :tournaments, only: %i[create edit show index] do
    resource :teams, only: %i[create update]
    patch :start, on: :member
  end

  root "tournaments#index"
end
