Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  #root "application#index"
  # root "posts#index"
  resources :reservations
  resources :movies do
    member do
      get "reservation"
    end

    resources :schedules do
      resources :reservations
    end
  end

  resources :sheets

  namespace :admin do
    resources :movies do
      resources :schedules
    end

    resources :reservations
  end
end
