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

ActiveRecord::Schema.define(version: 2022_03_15_103651) do

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

  create_table "cars", force: :cascade do |t|
    t.string "marca"
    t.string "modelo"
    t.string "kilometraje"
    t.string "primeramat"
    t.string "chasis"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "matricula"
    t.string "matriculanum"
  end

  create_table "cobros", force: :cascade do |t|
    t.decimal "cantidad"
    t.date "fecha_teorica"
    t.date "fecha_efectiva"
    t.bigint "sale_id", null: false
    t.string "tipo"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["sale_id"], name: "index_cobros_on_sale_id"
  end

  create_table "compras", force: :cascade do |t|
    t.integer "precio"
    t.decimal "iva"
    t.date "fecha"
    t.string "tipo"
    t.string "categoria"
    t.bigint "persona_id", null: false
    t.bigint "car_id"
    t.bigint "operacion_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "modificar"
    t.index ["car_id"], name: "index_compras_on_car_id"
    t.index ["operacion_id"], name: "index_compras_on_operacion_id"
    t.index ["persona_id"], name: "index_compras_on_persona_id"
  end

  create_table "operacions", force: :cascade do |t|
    t.string "estado"
    t.string "comercial"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "titol"
    t.string "venedor"
    t.boolean "comptabilitzat"
  end

  create_table "pagos", force: :cascade do |t|
    t.decimal "cantidad"
    t.date "fecha_teorica"
    t.date "fecha_efectiva"
    t.bigint "compra_id", null: false
    t.string "tipo"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["compra_id"], name: "index_pagos_on_compra_id"
  end

  create_table "personas", force: :cascade do |t|
    t.string "nombre"
    t.string "apellido"
    t.string "mail"
    t.string "telefono"
    t.string "direccion"
    t.string "ciudad"
    t.string "cp"
    t.string "pais"
    t.string "cif"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "sales", force: :cascade do |t|
    t.integer "precio"
    t.decimal "iva"
    t.date "fecha"
    t.bigint "persona_id", null: false
    t.bigint "car_id", null: false
    t.bigint "operacion_id", null: false
    t.string "numero"
    t.boolean "coche_cambio"
    t.integer "coche_cambio_precio"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "coche_cambio_modelo"
    t.string "coche_cambio_km"
    t.string "coche_cambio_matricula"
    t.string "coche_cambio_ano"
    t.index ["car_id"], name: "index_sales_on_car_id"
    t.index ["operacion_id"], name: "index_sales_on_operacion_id"
    t.index ["persona_id"], name: "index_sales_on_persona_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "cobros", "sales"
  add_foreign_key "compras", "cars"
  add_foreign_key "compras", "operacions"
  add_foreign_key "compras", "personas"
  add_foreign_key "pagos", "compras"
  add_foreign_key "sales", "cars"
  add_foreign_key "sales", "operacions"
  add_foreign_key "sales", "personas"
end
