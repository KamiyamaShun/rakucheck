Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }
  
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
