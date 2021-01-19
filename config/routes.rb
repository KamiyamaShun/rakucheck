Rails.application.routes.draw do
  devise_for :users
  root to: 'employees#index'
  resources :employees
end
