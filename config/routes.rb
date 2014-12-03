Rails.application.routes.draw do
  resources :home, only: :index
  resources :students
  resources :courses

  root to: 'home#index'
end
