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

ActiveRecord::Schema.define(version: 2020_10_27_151301) do

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
    t.bigint "encuentro_id", null: false
    t.datetime "inicio"
    t.datetime "termino"
    t.string "titulo"
    t.string "descripcion"
    t.string "lugar"
    t.boolean "titulo_en_calendario", default: true, null: false
    t.boolean "participantes_en_calendario", default: true, null: false
    t.text "texto_calendario"
    t.boolean "texto_en_calendario", default: false, null: false
    t.text "details"
    t.boolean "show_description_in_calendar", default: false
    t.index ["encuentro_id"], name: "index_actividades_on_encuentro_id"
  end

  create_table "actividades_etiquetas", force: :cascade do |t|
    t.bigint "actividad_id", null: false
    t.bigint "etiqueta_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["actividad_id"], name: "index_actividades_etiquetas_on_actividad_id"
    t.index ["etiqueta_id"], name: "index_actividades_etiquetas_on_etiqueta_id"
  end

  create_table "actividades_participantes", force: :cascade do |t|
    t.bigint "actividad_id", null: false
    t.bigint "participante_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["actividad_id"], name: "index_actividades_participantes_on_actividad_id"
    t.index ["participante_id"], name: "index_actividades_participantes_on_participante_id"
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
    t.boolean "show_countdown", default: true, null: false
    t.boolean "show_instagram_feed", default: true, null: false
    t.boolean "show_past_events", default: true, null: false
  end

  create_table "etiquetas", force: :cascade do |t|
    t.string "nombre", null: false
    t.text "descripcion"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "fechas_actividades", force: :cascade do |t|
    t.bigint "encuentro_id", null: false
    t.date "fecha"
    t.string "lugar"
    t.string "tematica"
    t.index ["encuentro_id"], name: "index_fechas_actividades_on_encuentro_id"
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

  create_table "participantes", force: :cascade do |t|
    t.string "nombre"
    t.text "bio"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "instagram"
    t.string "twitter"
    t.string "facebook"
    t.string "email"
    t.string "youtube"
  end

  create_table "presentaciones", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "concierto_id", null: false
    t.integer "orden"
    t.index ["concierto_id"], name: "index_presentaciones_on_concierto_id"
  end

  create_table "slides", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.bigint "encuentro_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "order", default: 0, null: false
    t.index ["encuentro_id"], name: "index_slides_on_encuentro_id"
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
  add_foreign_key "actividades", "encuentros"
  add_foreign_key "actividades_etiquetas", "actividades"
  add_foreign_key "actividades_etiquetas", "etiquetas"
  add_foreign_key "actividades_participantes", "actividades"
  add_foreign_key "actividades_participantes", "participantes"
  add_foreign_key "artistas_presentaciones", "artistas"
  add_foreign_key "artistas_presentaciones", "presentaciones"
  add_foreign_key "artistas_visibles", "artistas"
  add_foreign_key "artistas_visibles", "encuentros"
  add_foreign_key "conciertos", "encuentros"
  add_foreign_key "fechas_actividades", "encuentros"
  add_foreign_key "obras_presentaciones", "obras"
  add_foreign_key "obras_presentaciones", "presentaciones"
  add_foreign_key "presentaciones", "conciertos"
  add_foreign_key "slides", "encuentros"
end
