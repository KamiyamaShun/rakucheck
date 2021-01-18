Rails.application.routes.draw do
  devise_for :users
  get 'employees/index'
  root to: 'employees#index'
end
