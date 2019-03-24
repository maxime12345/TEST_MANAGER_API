# frozen_string_literal: true

Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      resources :features, only: %i[index show create]
      resources :tests, only: %i[index show update create]
    end
  end
end
