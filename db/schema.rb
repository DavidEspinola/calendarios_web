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

ActiveRecord::Schema.define(version: 20141006115541) do

  create_table "asig_tags", force: true do |t|
    t.integer  "recurso_id"
    t.integer  "tag_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "tipo"
  end

  add_index "asig_tags", ["recurso_id"], name: "index_asig_tags_on_recurso_id"
  add_index "asig_tags", ["tag_id"], name: "index_asig_tags_on_tag_id"

  create_table "asignaturas", force: true do |t|
    t.string   "nombre"
    t.text     "descripcion"
    t.integer  "asig_tag_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "asignaturas", ["asig_tag_id"], name: "index_asignaturas_on_asig_tag_id"

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
    t.integer  "asig_tag_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "clases", ["asig_tag_id"], name: "index_clases_on_asig_tag_id"

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
    t.integer  "tag_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "programas", ["tag_id"], name: "index_programas_on_tag_id"

  create_table "tags", force: true do |t|
    t.string   "nombre"
    t.text     "descripcion"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
