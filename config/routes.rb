# frozen_string_literal: true

Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      resources :features, only: %i[index show create] do
        resources :tests, only: %i[create]
      end
      resources :tests, only: %i[update]
    end
  end
end
