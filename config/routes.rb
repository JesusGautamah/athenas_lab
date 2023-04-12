# frozen_string_literal: true

Rails.application.routes.draw do
  resources :chat_summaries
  resources :message_summaries
  resources :chat_ideas
  resources :message_ideas
  resources :chat_recomendations
  resources :message_recomendations
  resources :chat_recipes
  resources :message_recipes
  resources :chat_names
  resources :message_names
  resources :chat_ads
  resources :message_ads
  resources :chat_analytics
  resources :message_analytics
  resources :parsed_sctructures
  resources :gen_images
  resources :gen_spreadsheets
  resources :code_explanations
  resources :message_corrections
  resources :chat_books
  resources :message_books
  resources :chat_questions
  resources :message_questions
  resources :chats do
    resources :messages
    resources :chat_books
    resources :chat_questions
    resources :chat_analytics
    resources :chat_ads
    resources :chat_names
    resources :chat_recipes
    resources :chat_recomendations
    resources :chat_ideas
    resources :chat_summaries
  end
  resources :messages do
    resources :message_corrections
    resources :code_explanations
    resources :gen_spreadsheets
    resources :gen_images
    resources :parsed_sctructures
    resources :message_analytics
    resources :message_ads
    resources :message_names
    resources :message_recipes
    resources :message_recomendations
    resources :message_ideas
    resources :message_summaries
  end
  post "message_extract_keywords", to: "messages#extract_keywords"
  post "message_generate_image", to: "messages#generate_image"
  post "message_correct_grammar", to: "messages#correct_grammar"
  # devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"
  devise_for :users, controllers: {
    # sessions: 'users/sessions',
    registrations: "users/registrations"
    # passwords: 'users/passwords',
    # confirmations: 'users/confirmations',
    # unlocks: 'users/unlocks',
    # omniauth_callbacks: 'users/omniauth_callbacks'
  }

  devise_scope :user do
    get "users/sign_out", to: "devise/sessions#destroy"
  end

  get "actors", to: "home#actors"
end
