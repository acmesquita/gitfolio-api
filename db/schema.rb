# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_10_28_155513) do

  create_table "abilities", force: :cascade do |t|
    t.string "kind"
    t.string "description"
    t.string "language"
    t.integer "portfolio_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["portfolio_id"], name: "index_abilities_on_portfolio_id"
  end

  create_table "portfolios", force: :cascade do |t|
    t.string "login"
    t.string "avatar_url"
    t.string "name"
    t.string "location"
    t.string "email"
    t.string "bio"
    t.datetime "start"
    t.datetime "last_update"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "html_url"
  end

  create_table "repositories", force: :cascade do |t|
    t.string "name"
    t.string "full_name"
    t.string "owner"
    t.string "html_url"
    t.string "description"
    t.datetime "start"
    t.datetime "last_update"
    t.datetime "last_pushed"
    t.string "language"
    t.integer "portfolio_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["portfolio_id"], name: "index_repositories_on_portfolio_id"
  end

  add_foreign_key "abilities", "portfolios"
  add_foreign_key "repositories", "portfolios"
end
