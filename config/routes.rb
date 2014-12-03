Rails.application.routes.draw do
  resources :home, only: :index
  resources :students
  resources :courses
  
  resources :classrooms do
    member do
      get :course
      get :student
      post :fetch_courses
      post :fetch_students
    end
  end

  root to: 'home#index'
end
