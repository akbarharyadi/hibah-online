# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20180916163624) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "ahoy_events", force: :cascade do |t|
    t.bigint "visit_id"
    t.bigint "user_id"
    t.string "name"
    t.jsonb "properties"
    t.datetime "time"
    t.index "properties jsonb_path_ops", name: "index_ahoy_events_on_properties_jsonb_path_ops", using: :gin
    t.index ["name", "time"], name: "index_ahoy_events_on_name_and_time"
    t.index ["user_id"], name: "index_ahoy_events_on_user_id"
    t.index ["visit_id"], name: "index_ahoy_events_on_visit_id"
  end

  create_table "ahoy_visits", force: :cascade do |t|
    t.string "visit_token"
    t.string "visitor_token"
    t.bigint "user_id"
    t.string "ip"
    t.text "user_agent"
    t.text "referrer"
    t.string "referring_domain"
    t.string "search_keyword"
    t.text "landing_page"
    t.string "browser"
    t.string "os"
    t.string "device_type"
    t.string "country"
    t.string "region"
    t.string "city"
    t.string "utm_source"
    t.string "utm_medium"
    t.string "utm_term"
    t.string "utm_content"
    t.string "utm_campaign"
    t.datetime "started_at"
    t.index ["user_id"], name: "index_ahoy_visits_on_user_id"
    t.index ["visit_token"], name: "index_ahoy_visits_on_visit_token", unique: true
  end

  create_table "danas", force: :cascade do |t|
    t.bigint "hibah_id"
    t.float "jumlah"
    t.string "deskripsi"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["hibah_id"], name: "index_danas_on_hibah_id"
  end

  create_table "dinas", force: :cascade do |t|
    t.string "code"
    t.string "name"
    t.text "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "disposisis", force: :cascade do |t|
    t.integer "status"
    t.text "keterangan"
    t.integer "user_id"
    t.integer "hibah_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "distribusis", force: :cascade do |t|
    t.integer "dina_id"
    t.text "keterangan"
    t.integer "user_id"
    t.integer "hibah_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "evaluasis", force: :cascade do |t|
    t.integer "user_id"
    t.integer "hibah_id"
    t.text "keterangan"
    t.string "file_upload"
  end

  create_table "fotos", force: :cascade do |t|
    t.bigint "hibah_id"
    t.string "file"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["hibah_id"], name: "index_fotos_on_hibah_id"
  end

  create_table "hibahs", force: :cascade do |t|
    t.string "nama"
    t.text "alamat"
    t.string "judul_kegiatan"
    t.text "latar_belakang"
    t.text "maksud_dan_tujuan"
    t.integer "status"
    t.string "proposal"
    t.integer "user_id"
    t.integer "on_process"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "gambar"
  end

  create_table "homepages", force: :cascade do |t|
    t.string "gambar_1"
    t.text "text_1_1"
    t.text "text_1_2"
    t.text "text_1_3"
    t.string "gambar_2"
    t.text "text_2_1"
    t.text "text_2_2"
    t.string "gambar_3"
    t.text "text_3_1"
    t.text "text_3_2"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "kategoris", force: :cascade do |t|
    t.string "name"
    t.integer "dina_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "kuncis", force: :cascade do |t|
    t.string "msg_open"
    t.string "msg_close"
    t.integer "status"
    t.date "start_date"
    t.date "final_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "penetapans", force: :cascade do |t|
    t.integer "user_id"
    t.integer "hibah_id"
    t.date "tgl_ketetapan"
  end

  create_table "peraturans", force: :cascade do |t|
    t.string "nama"
    t.string "file"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pertimbangans", force: :cascade do |t|
    t.integer "user_id"
    t.integer "hibah_id"
    t.integer "status"
    t.text "keterangan"
    t.float "realisasi"
    t.string "file"
  end

  create_table "profiles", force: :cascade do |t|
    t.string "nama_lengkap"
    t.string "no_telp"
    t.string "foto"
    t.integer "jenis_kelamin"
    t.string "organisasi"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "seleksis", force: :cascade do |t|
    t.integer "status"
    t.text "keterangan"
    t.integer "user_id"
    t.integer "hibah_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tahapans", force: :cascade do |t|
    t.string "icon"
    t.string "judul"
    t.text "deskripsi"
    t.integer "homepage_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tentangs", force: :cascade do |t|
    t.string "judul"
    t.text "konten"
    t.string "gambar"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "role_id"
    t.integer "dina_id"
    t.string "avatar"
    t.string "nama_ketua"
    t.text "alamat"
    t.string "nomor_telp"
    t.integer "activate"
    t.string "nama_organisasi"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "danas", "hibahs"
  add_foreign_key "fotos", "hibahs"
end
