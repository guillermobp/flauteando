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

ActiveRecord::Schema.define(version: 2020_01_20_003448) do

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
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "actividades", force: :cascade do |t|
    t.bigint "fecha_actividad_id", null: false
    t.time "inicio"
    t.time "termino"
    t.string "titulo"
    t.string "descripcion"
    t.string "lugar"
    t.index ["fecha_actividad_id"], name: "index_actividades_on_fecha_actividad_id"
  end

  create_table "artistas", force: :cascade do |t|
    t.string "nombre"
    t.text "bio"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "artistas_presentaciones", force: :cascade do |t|
    t.bigint "artista_id", null: false
    t.bigint "presentacion_id", null: false
    t.text "instrumentos"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["artista_id"], name: "index_artistas_presentaciones_on_artista_id"
    t.index ["presentacion_id"], name: "index_artistas_presentaciones_on_presentacion_id"
  end

  create_table "artistas_visibles", force: :cascade do |t|
    t.bigint "artista_id", null: false
    t.bigint "encuentro_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "orden", default: 1
    t.index ["artista_id"], name: "index_artistas_visibles_on_artista_id"
    t.index ["encuentro_id"], name: "index_artistas_visibles_on_encuentro_id"
  end

  create_table "conciertos", force: :cascade do |t|
    t.date "fecha"
    t.time "hora"
    t.string "lugar"
    t.bigint "encuentro_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["encuentro_id"], name: "index_conciertos_on_encuentro_id"
  end

  create_table "encuentros", force: :cascade do |t|
    t.integer "version"
    t.string "titulo"
    t.string "epigrafe"
    t.string "bajada"
    t.string "mision"
    t.string "vision"
    t.boolean "habilitado"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "fechas", force: :cascade do |t|
    t.bigint "encuentro_id", null: false
    t.date "fecha"
    t.index ["encuentro_id"], name: "index_fechas_on_encuentro_id"
  end

  create_table "fechas_actividades", force: :cascade do |t|
    t.bigint "fecha_id", null: false
    t.string "lugar"
    t.string "tematica"
    t.index ["fecha_id"], name: "index_fechas_actividades_on_fecha_id"
  end

  create_table "obras", force: :cascade do |t|
    t.string "titulo"
    t.string "compositor"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "obras_presentaciones", force: :cascade do |t|
    t.bigint "obra_id", null: false
    t.bigint "presentacion_id", null: false
    t.integer "orden"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["obra_id"], name: "index_obras_presentaciones_on_obra_id"
    t.index ["presentacion_id"], name: "index_obras_presentaciones_on_presentacion_id"
  end

  create_table "presentaciones", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "concierto_id", null: false
    t.integer "orden"
    t.index ["concierto_id"], name: "index_presentaciones_on_concierto_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.string "remember_digest"
    t.string "reset_digest"
    t.datetime "reset_sent_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "actividades", "fechas_actividades"
  add_foreign_key "artistas_presentaciones", "artistas"
  add_foreign_key "artistas_presentaciones", "presentaciones"
  add_foreign_key "artistas_visibles", "artistas"
  add_foreign_key "artistas_visibles", "encuentros"
  add_foreign_key "conciertos", "encuentros"
  add_foreign_key "fechas", "encuentros"
  add_foreign_key "fechas_actividades", "fechas"
  add_foreign_key "obras_presentaciones", "obras"
  add_foreign_key "obras_presentaciones", "presentaciones"
  add_foreign_key "presentaciones", "conciertos"
end
