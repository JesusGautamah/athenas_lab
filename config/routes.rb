Rails.application.routes.draw do
  resources :chats
  # devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"
  devise_for :users, controllers: {
    # sessions: 'users/sessions',
    registrations: 'users/registrations',
    # passwords: 'users/passwords',
    # confirmations: 'users/confirmations',
    # unlocks: 'users/unlocks',
    # omniauth_callbacks: 'users/omniauth_callbacks'
  }

  devise_scope :user do
    get "users/sign_out", to: "devise/sessions#destroy"
  end
end
