# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20141121104327) do

  create_table "asignaturas", force: true do |t|
    t.string   "nombre"
    t.text     "descripcion"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "tags"
    t.text     "keywords"
  end

  create_table "calendarios", force: true do |t|
    t.integer  "programa_id"
    t.text     "texto_extra"
    t.datetime "convocatoria"
    t.integer  "descanso_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "calendarios", ["descanso_id"], name: "index_calendarios_on_descanso_id"
  add_index "calendarios", ["programa_id"], name: "index_calendarios_on_programa_id"

  create_table "clases", force: true do |t|
    t.string   "nombre"
    t.text     "descripcion"
    t.string   "recursos"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "tags"
    t.text     "keywords"
  end

  create_table "datos_calendarios", force: true do |t|
    t.integer  "calendario_id"
    t.integer  "asignatura_id"
    t.integer  "clase_id"
    t.datetime "inicio"
    t.datetime "fin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "datos_calendarios", ["asignatura_id"], name: "index_datos_calendarios_on_asignatura_id"
  add_index "datos_calendarios", ["calendario_id"], name: "index_datos_calendarios_on_calendario_id"
  add_index "datos_calendarios", ["clase_id"], name: "index_datos_calendarios_on_clase_id"

  create_table "descansos", force: true do |t|
    t.string   "nombre"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "patron_asignaturas", force: true do |t|
    t.integer  "calendario_id"
    t.integer  "asignatura_id"
    t.integer  "orden"
    t.integer  "desfase"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "patron_asignaturas", ["asignatura_id"], name: "index_patron_asignaturas_on_asignatura_id"
  add_index "patron_asignaturas", ["calendario_id"], name: "index_patron_asignaturas_on_calendario_id"

  create_table "patron_clases", force: true do |t|
    t.integer  "asignatura_id"
    t.integer  "clase_id"
    t.integer  "orden"
    t.integer  "duracion"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "patron_clases", ["asignatura_id"], name: "index_patron_clases_on_asignatura_id"
  add_index "patron_clases", ["clase_id"], name: "index_patron_clases_on_clase_id"

  create_table "patron_descansos", force: true do |t|
    t.integer  "descanso_id"
    t.integer  "pausa_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "patron_descansos", ["descanso_id"], name: "index_patron_descansos_on_descanso_id"
  add_index "patron_descansos", ["pausa_id"], name: "index_patron_descansos_on_pausa_id"

  create_table "pausas", force: true do |t|
    t.string   "nombre"
    t.datetime "inicio"
    t.datetime "fin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "programas", force: true do |t|
    t.string   "nombre"
    t.text     "descripcion"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "tags"
    t.text     "keywords"
  end

  create_table "usuarios", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "usuarios", ["email"], name: "index_usuarios_on_email", unique: true
  add_index "usuarios", ["reset_password_token"], name: "index_usuarios_on_reset_password_token", unique: true

end
