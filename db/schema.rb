# frozen_string_literal: true

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 20_230_412_013_653) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index %w[record_type record_id name blob_id], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index %w[blob_id variation_digest], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "chat_ads", force: :cascade do |t|
    t.text "title", null: false
    t.text "description", null: false
    t.text "content", null: false
    t.bigint "chat_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["chat_id"], name: "index_chat_ads_on_chat_id"
  end

  create_table "chat_analytics", force: :cascade do |t|
    t.bigint "chat_id", null: false
    t.text "title", null: false
    t.text "description", null: false
    t.text "content", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["chat_id"], name: "index_chat_analytics_on_chat_id"
  end

  create_table "chat_books", force: :cascade do |t|
    t.bigint "chat_id", null: false
    t.text "title", null: false
    t.text "description", default: "NOT DEFINED", null: false
    t.text "author", default: "NOT REGISTERED", null: false
    t.integer "year"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["chat_id"], name: "index_chat_books_on_chat_id"
  end

  create_table "chat_ideas", force: :cascade do |t|
    t.text "title", null: false
    t.text "description", null: false
    t.text "content", null: false
    t.bigint "chat_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["chat_id"], name: "index_chat_ideas_on_chat_id"
  end

  create_table "chat_names", force: :cascade do |t|
    t.text "name", default: [], null: false, array: true
    t.bigint "chat_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["chat_id"], name: "index_chat_names_on_chat_id"
  end

  create_table "chat_questions", force: :cascade do |t|
    t.bigint "chat_id", null: false
    t.text "question", null: false
    t.text "answers", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["chat_id"], name: "index_chat_questions_on_chat_id"
  end

  create_table "chat_recipes", force: :cascade do |t|
    t.text "title", null: false
    t.text "description", null: false
    t.bigint "chat_id", null: false
    t.text "content", null: false
    t.text "steps", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["chat_id"], name: "index_chat_recipes_on_chat_id"
  end

  create_table "chat_recomendations", force: :cascade do |t|
    t.text "title", null: false
    t.text "description", null: false
    t.bigint "chat_id", null: false
    t.text "content", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["chat_id"], name: "index_chat_recomendations_on_chat_id"
  end

  create_table "chat_summaries", force: :cascade do |t|
    t.text "title", null: false
    t.text "description", null: false
    t.text "content", null: false
    t.bigint "chat_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["chat_id"], name: "index_chat_summaries_on_chat_id"
  end

  create_table "chats", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.integer "status", default: 0, null: false
    t.string "title", limit: 100, default: "", null: false
    t.text "description", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "public", default: false, null: false
    t.text "keywords", default: [], array: true
    t.string "actor"
    t.text "prompt"
    t.string "language"
    t.index ["user_id"], name: "index_chats_on_user_id"
  end

  create_table "code_explanations", force: :cascade do |t|
    t.text "title"
    t.bigint "message_id", null: false
    t.text "description", null: false
    t.text "code", null: false
    t.text "explanation", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["message_id"], name: "index_code_explanations_on_message_id"
  end

  create_table "errors", force: :cascade do |t|
    t.integer "chat_id"
    t.integer "user_id"
    t.text "message", default: "", null: false
    t.text "backtrace", default: [], null: false, array: true
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "gen_images", force: :cascade do |t|
    t.bigint "message_id", null: false
    t.text "gen_url", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["message_id"], name: "index_gen_images_on_message_id"
  end

  create_table "gen_spreadsheets", force: :cascade do |t|
    t.text "title", null: false
    t.bigint "message_id", null: false
    t.text "description", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["message_id"], name: "index_gen_spreadsheets_on_message_id"
  end

  create_table "message_ads", force: :cascade do |t|
    t.text "title", null: false
    t.text "description", null: false
    t.text "content", null: false
    t.bigint "message_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["message_id"], name: "index_message_ads_on_message_id"
  end

  create_table "message_analytics", force: :cascade do |t|
    t.text "title", null: false
    t.text "description", null: false
    t.text "content", null: false
    t.bigint "message_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["message_id"], name: "index_message_analytics_on_message_id"
  end

  create_table "message_books", force: :cascade do |t|
    t.bigint "message_id", null: false
    t.text "title", null: false
    t.text "description", default: "NOT DEFINED", null: false
    t.text "author", default: "NOT REGISTERED", null: false
    t.integer "year"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["message_id"], name: "index_message_books_on_message_id"
  end

  create_table "message_corrections", force: :cascade do |t|
    t.bigint "message_id", null: false
    t.text "description", null: false
    t.text "content", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["message_id"], name: "index_message_corrections_on_message_id"
  end

  create_table "message_ideas", force: :cascade do |t|
    t.text "title", null: false
    t.text "description", null: false
    t.bigint "message_id", null: false
    t.text "content", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["message_id"], name: "index_message_ideas_on_message_id"
  end

  create_table "message_names", force: :cascade do |t|
    t.text "name", default: [], null: false, array: true
    t.bigint "message_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["message_id"], name: "index_message_names_on_message_id"
  end

  create_table "message_questions", force: :cascade do |t|
    t.bigint "message_id", null: false
    t.text "question", null: false
    t.text "answers", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["message_id"], name: "index_message_questions_on_message_id"
  end

  create_table "message_recipes", force: :cascade do |t|
    t.text "title", null: false
    t.text "description", null: false
    t.bigint "message_id", null: false
    t.text "content", null: false
    t.text "steps", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["message_id"], name: "index_message_recipes_on_message_id"
  end

  create_table "message_recomendations", force: :cascade do |t|
    t.text "title", null: false
    t.text "description", null: false
    t.bigint "message_id", null: false
    t.text "content", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["message_id"], name: "index_message_recomendations_on_message_id"
  end

  create_table "message_summaries", force: :cascade do |t|
    t.text "title", null: false
    t.text "description", null: false
    t.text "content", null: false
    t.bigint "message_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["message_id"], name: "index_message_summaries_on_message_id"
  end

  create_table "messages", force: :cascade do |t|
    t.bigint "chat_id", null: false
    t.integer "role", default: 0, null: false
    t.text "content", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "keywords", default: [], array: true
    t.index ["chat_id"], name: "index_messages_on_chat_id"
  end

  create_table "parsed_sctructures", force: :cascade do |t|
    t.bigint "message_id", null: false
    t.text "title", null: false
    t.text "description", null: false
    t.text "gen_structure", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["message_id"], name: "index_parsed_sctructures_on_message_id"
  end

  create_table "user_actions", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.text "action", default: "", null: false
    t.text "description", default: "", null: false
    t.integer "role", default: 0, null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["user_id"], name: "index_user_actions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.string "telegram_id"
    t.string "discord_id"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "current_chat_id", default: "0", null: false
    t.string "role", default: "0", null: false
    t.string "open_chats", default: "0", null: false
    t.string "closed_chats", default: "0", null: false
    t.string "total_chats", default: "0", null: false
    t.string "total_messages", default: "0", null: false
    t.string "password_hash"
    t.string "password_salt"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "visitor_actions", force: :cascade do |t|
    t.bigint "visitor_id", null: false
    t.text "action", null: false
    t.text "description", null: false
    t.integer "role", default: 0, null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["visitor_id"], name: "index_visitor_actions_on_visitor_id"
  end

  create_table "visitors", force: :cascade do |t|
    t.string "telegram_id", limit: 100
    t.string "discord_id", limit: 100
    t.integer "platform", default: 0, null: false
    t.string "name", null: false
    t.integer "current_user_id", default: 0
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "chat_ads", "chats"
  add_foreign_key "chat_analytics", "chats"
  add_foreign_key "chat_books", "chats"
  add_foreign_key "chat_ideas", "chats"
  add_foreign_key "chat_names", "chats"
  add_foreign_key "chat_questions", "chats"
  add_foreign_key "chat_recipes", "chats"
  add_foreign_key "chat_recomendations", "chats"
  add_foreign_key "chat_summaries", "chats"
  add_foreign_key "chats", "users"
  add_foreign_key "code_explanations", "messages"
  add_foreign_key "gen_images", "messages"
  add_foreign_key "gen_spreadsheets", "messages"
  add_foreign_key "message_ads", "messages"
  add_foreign_key "message_analytics", "messages"
  add_foreign_key "message_books", "messages"
  add_foreign_key "message_corrections", "messages"
  add_foreign_key "message_ideas", "messages"
  add_foreign_key "message_names", "messages"
  add_foreign_key "message_questions", "messages"
  add_foreign_key "message_recipes", "messages"
  add_foreign_key "message_recomendations", "messages"
  add_foreign_key "message_summaries", "messages"
  add_foreign_key "messages", "chats"
  add_foreign_key "parsed_sctructures", "messages"
  add_foreign_key "user_actions", "users"
  add_foreign_key "visitor_actions", "visitors"
end
