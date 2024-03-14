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

ActiveRecord::Schema[7.1].define(version: 2024_03_14_083840) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "user_words", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "word_id", null: false
    t.boolean "mastered"
    t.datetime "last_reviewed_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_user_words_on_user_id"
    t.index ["word_id"], name: "index_user_words_on_word_id"
  end

  create_table "users", comment: "用户", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "word_book_words", comment: "单词表单词关联", force: :cascade do |t|
    t.bigint "word_id"
    t.bigint "word_book_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["word_book_id"], name: "index_word_book_words_on_word_book_id"
    t.index ["word_id"], name: "index_word_book_words_on_word_id"
  end

  create_table "word_books", comment: "单词本", force: :cascade do |t|
    t.string "name", null: false, comment: "单词本名称"
    t.string "description", comment: "描述"
    t.integer "kind", default: 0, comment: "类型(0: 系统, 1: 用户自定义)"
    t.bigint "user_id", comment: "用户"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["kind"], name: "index_word_books_on_kind"
    t.index ["name"], name: "index_word_books_on_name", unique: true
    t.index ["user_id"], name: "index_word_books_on_user_id"
  end

  create_table "words", comment: "单词", force: :cascade do |t|
    t.string "name", null: false, comment: "单词"
    t.string "alternate_spelling", comment: "其它拼写形式"
    t.string "meaning", null: false, comment: "中文意思"
    t.string "sentence", comment: "例句"
    t.string "phonetic", comment: "音标"
    t.bigint "created_by_id", comment: "创建者"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["alternate_spelling"], name: "index_words_on_alternate_spelling"
    t.index ["created_by_id"], name: "index_words_on_created_by_id"
    t.index ["name"], name: "index_words_on_name", unique: true
  end

  add_foreign_key "user_words", "users"
  add_foreign_key "user_words", "words"
  add_foreign_key "word_book_words", "word_books"
  add_foreign_key "word_book_words", "words"
  add_foreign_key "word_books", "users"
  add_foreign_key "words", "users", column: "created_by_id"
end
