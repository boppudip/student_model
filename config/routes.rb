Rails.application.routes.draw do
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'
  root "students#index"
  resources :students
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
