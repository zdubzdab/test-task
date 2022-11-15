# frozen_string_literal: true

Rails.application.routes.draw do
  resources :tournaments, only: %i[create show index] do
    resources :teams, only: %i[create update]
  end

  root "tournaments#index"
end
