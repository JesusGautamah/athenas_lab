# frozen_string_literal: true

require "sidekiq/web"

Rails.application.routes.draw do
  resources :hermetics
  resources :conductors
  resources :scenes
  mount Sidekiq::Web => "/sidekiq"
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
  get "clean_up_chat_history", to: "chats#clean_up_chat_history"

  post "add_chat_to_board_project", to: "board_projects#add_chat"
  post "remove_chat_from_board_project", to: "board_projects#remove_chat"
  post "message_extract_keywords", to: "messages#extract_keywords"
  post "message_generate_image", to: "messages#generate_image"
  post "message_correct_grammar", to: "messages#correct_grammar"

  delete "clean_memories", to: "conductors#clean_memories"

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

  resources :board_projects do
    resources :scenes

    resources :chats do
      resources :messages
    end

    resources :conductors do
      resources :memories
      resources :submemories
    end
  end

  resources :conductors do
    resources :memories
    resources :submemories
  end
end
