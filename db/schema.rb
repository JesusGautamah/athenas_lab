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

ActiveRecord::Schema[7.0].define(version: 2023_05_27_212245) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
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
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "board_projects", force: :cascade do |t|
    t.integer "chats_count", default: 0, null: false
    t.string "title", null: false
    t.text "description", null: false
    t.string "markdown"
    t.string "ipynb"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "file_display_order"
    t.boolean "public"
    t.integer "owner_id"
    t.integer "step_count"
    t.integer "sleep_seconds"
    t.integer "current_step_count"
    t.text "current_step_context"
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

  create_table "conductors", force: :cascade do |t|
    t.bigint "board_project_id", null: false
    t.text "cast", default: [], array: true
    t.bigint "scene_id", null: false
    t.text "system_config"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["board_project_id"], name: "index_conductors_on_board_project_id"
    t.index ["scene_id"], name: "index_conductors_on_scene_id"
  end

  create_table "gen_images", force: :cascade do |t|
    t.bigint "message_id", null: false
    t.text "gen_url", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["message_id"], name: "index_gen_images_on_message_id"
  end

  create_table "hermetics", force: :cascade do |t|
    t.text "laws", default: [], array: true
    t.bigint "scene_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["scene_id"], name: "index_hermetics_on_scene_id"
  end

  create_table "memories", force: :cascade do |t|
    t.bigint "conductor_id", null: false
    t.text "content"
    t.string "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "step_context"
    t.index ["conductor_id"], name: "index_memories_on_conductor_id"
  end

  create_table "message_corrections", force: :cascade do |t|
    t.bigint "message_id", null: false
    t.text "description", null: false
    t.text "content", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["message_id"], name: "index_message_corrections_on_message_id"
  end

  create_table "messages", force: :cascade do |t|
    t.bigint "chat_id", null: false
    t.integer "role", default: 0, null: false
    t.text "content", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "keywords", default: [], array: true
    t.text "markdown"
    t.index ["chat_id"], name: "index_messages_on_chat_id"
  end

  create_table "project_chats", force: :cascade do |t|
    t.bigint "board_project_id", null: false
    t.bigint "chat_id", null: false
    t.string "function_title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["board_project_id"], name: "index_project_chats_on_board_project_id"
    t.index ["chat_id"], name: "index_project_chats_on_chat_id"
  end

  create_table "project_users", force: :cascade do |t|
    t.bigint "board_project_id", null: false
    t.bigint "user_id", null: false
    t.integer "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["board_project_id"], name: "index_project_users_on_board_project_id"
    t.index ["user_id"], name: "index_project_users_on_user_id"
  end

  create_table "scenes", force: :cascade do |t|
    t.text "past_points", default: [], array: true
    t.text "initial_point"
    t.text "actual_point"
    t.text "objective_point"
    t.bigint "board_project_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["board_project_id"], name: "index_scenes_on_board_project_id"
  end

  create_table "submemories", force: :cascade do |t|
    t.bigint "conductor_id", null: false
    t.text "step_context"
    t.text "content"
    t.integer "step"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "title"
    t.index ["conductor_id"], name: "index_submemories_on_conductor_id"
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
    t.string "openai_key"
    t.integer "gpt_model"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "chats", "users"
  add_foreign_key "conductors", "board_projects"
  add_foreign_key "conductors", "scenes"
  add_foreign_key "gen_images", "messages"
  add_foreign_key "hermetics", "scenes"
  add_foreign_key "memories", "conductors"
  add_foreign_key "message_corrections", "messages"
  add_foreign_key "messages", "chats"
  add_foreign_key "project_chats", "board_projects"
  add_foreign_key "project_chats", "chats"
  add_foreign_key "project_users", "board_projects"
  add_foreign_key "project_users", "users"
  add_foreign_key "scenes", "board_projects"
  add_foreign_key "submemories", "conductors"
end
