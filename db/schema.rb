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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130624055925) do

  create_table "aplicacion_periodicas", :force => true do |t|
    t.integer  "periodo_id"
    t.decimal  "monto",       :precision => 10, :scale => 0
    t.text     "descripcion"
    t.datetime "created_at",                                 :null => false
    t.datetime "updated_at",                                 :null => false
  end

  add_index "aplicacion_periodicas", ["periodo_id"], :name => "index_aplicacion_periodicas_on_periodo_id"

  create_table "creditos", :force => true do |t|
    t.text     "descripcion"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "deudas", :force => true do |t|
    t.decimal  "monto",       :precision => 10, :scale => 0
    t.datetime "contraido"
    t.text     "descripcion"
    t.integer  "credito_id"
    t.datetime "created_at",                                 :null => false
    t.datetime "updated_at",                                 :null => false
  end

  add_index "deudas", ["credito_id"], :name => "index_deudas_on_credito_id"

  create_table "deudas_egresos", :id => false, :force => true do |t|
    t.integer "deuda_id"
    t.integer "egreso_id"
  end

  create_table "egresos", :force => true do |t|
    t.text     "descripcion"
    t.datetime "aplicacion"
    t.decimal  "monto",                   :precision => 10, :scale => 4
    t.integer  "tipo_egreso_id"
    t.integer  "aplicacion_periodica_id"
    t.integer  "tipo_ingreso_id"
    t.datetime "created_at",                                             :null => false
    t.datetime "updated_at",                                             :null => false
  end

  add_index "egresos", ["aplicacion_periodica_id"], :name => "index_egresos_on_aplicacion_periodica_id"
  add_index "egresos", ["tipo_egreso_id"], :name => "index_egresos_on_tipo_egreso_id"
  add_index "egresos", ["tipo_ingreso_id"], :name => "index_egresos_on_tipo_ingreso_id"

  create_table "ingresos", :force => true do |t|
    t.text     "descripcion"
    t.datetime "aplicacion"
    t.decimal  "monto",           :precision => 10, :scale => 0
    t.integer  "tipo_ingreso_id"
    t.datetime "created_at",                                     :null => false
    t.datetime "updated_at",                                     :null => false
  end

  add_index "ingresos", ["tipo_ingreso_id"], :name => "index_ingresos_on_tipo_ingreso_id"

  create_table "pago_deudas", :id => false, :force => true do |t|
    t.integer "deuda_id"
    t.integer "egreso_id"
  end

  create_table "periodos", :force => true do |t|
    t.text     "descripcion"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "tipo_egresos", :force => true do |t|
    t.string   "descripcion"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "tipo_ingresos", :force => true do |t|
    t.string   "descripcion"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

end
