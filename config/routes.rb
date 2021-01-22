Rails.application.routes.draw do
  devise_for :users
  root to: 'employees#index'
  resources :employees do
    resources :conditions, only: [:new, :create]
  end
  resources :conditions, only: :index do
    collection do
      get 'search'
    end
  end
end
