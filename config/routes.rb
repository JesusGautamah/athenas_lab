# frozen_string_literal: true

Rails.application.routes.draw do
  root "home#index"
  devise_for :users, controllers: {
    registrations: "users/registrations"
  }

  devise_scope :user do
    get "users/sign_out", to: "devise/sessions#destroy"
  end

  get "select_chat_to_add", to: "board_projects#select_chat_to_add"
  get "select_chat_to_remove", to: "board_projects#select_chat_to_remove"
  get "autogpt", to: "board_projects#autogpt"
  get "actors", to: "home#actors"

  post "add_chat_to_board_project", to: "board_projects#add_chat"
  post "remove_chat_from_board_project", to: "board_projects#remove_chat"
  post "message_extract_keywords", to: "messages#extract_keywords"
  post "message_generate_image", to: "messages#generate_image"
  post "message_correct_grammar", to: "messages#correct_grammar"

  resources :project_users
  resources :project_chats
  resources :board_projects
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
  resources :chat_questions

  resources :chats do
    resources :messages
  end

  resources :messages do
    resources :gen_images
  end
end
