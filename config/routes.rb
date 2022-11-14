# frozen_string_literal: true

Rails.application.routes.draw do
  resources :tournaments, only: %i[create show index]

  root "tournaments#index"
end
