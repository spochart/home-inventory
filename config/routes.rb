Rails.application.routes.draw do
  resources :active_sessions, only: [:destroy] do
    collection do
      delete "destroy_all"
    end
  end

  get "login", to: "sessions#new", as: "new_session"
  post "login", to: "sessions#create", as: "sessions"
  delete "login", to: "sessions#destroy", as: "session"

  get "register", to: "registrations#new", as: "new_registration"
  post "register", to: "registrations#create", as: "registrations"

  get "home", to: "home#pages", as: "home"

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  root "pages#index"
end
