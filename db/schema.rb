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

ActiveRecord::Schema.define(version: 20170729013517) do

  create_table "arriendos", force: :cascade do |t|
    t.date     "fecha_arriendo"
    t.date     "fecha_entrega"
    t.text     "comentario",     limit: 65535
    t.float    "descuento",      limit: 24
    t.integer  "total_arriendo", limit: 4
    t.string   "nombre_faena",   limit: 255
    t.integer  "comuna_id",      limit: 4
    t.integer  "cliente_id",     limit: 4
    t.integer  "maquina_id",     limit: 4
    t.string   "estado",         limit: 255
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "clientes", force: :cascade do |t|
    t.integer  "rut_cliente",     limit: 4
    t.string   "dv",              limit: 255
    t.string   "nombre",          limit: 255
    t.text     "direccion",       limit: 65535
    t.string   "nombre_contacto", limit: 255
    t.string   "telefono",        limit: 255
    t.string   "mail",            limit: 255
    t.string   "giro",            limit: 255
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  create_table "estado_maquinas", force: :cascade do |t|
    t.string   "nombre",     limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "facturas", force: :cascade do |t|
    t.integer  "numero",          limit: 4
    t.text     "descripcion",     limit: 65535
    t.date     "fecha"
    t.integer  "total",           limit: 4
    t.integer  "maquina_id",      limit: 4
    t.integer  "tipo_factura_id", limit: 4
    t.integer  "proveedor_id",    limit: 4
    t.integer  "neto",            limit: 4
    t.string   "foto",            limit: 255
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "facturas", ["maquina_id"], name: "fk_rails_23c47a1ae9", using: :btree
  add_index "facturas", ["proveedor_id"], name: "fk_rails_8f1194c5d8", using: :btree
  add_index "facturas", ["tipo_factura_id"], name: "fk_rails_41e690de45", using: :btree

  create_table "infractions", force: :cascade do |t|
    t.date     "fecha"
    t.string   "lugar",       limit: 255
    t.text     "descripcion", limit: 65535
    t.integer  "total_multa", limit: 4
    t.integer  "operador_id", limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "maquinas", force: :cascade do |t|
    t.string   "codigo",            limit: 255
    t.string   "chasis",            limit: 255
    t.string   "motor",             limit: 255
    t.string   "patente",           limit: 255
    t.string   "marca",             limit: 255
    t.integer  "valor_hora",        limit: 4
    t.integer  "valor_dia",         limit: 4
    t.integer  "anio",              limit: 4
    t.string   "nombre",            limit: 255
    t.string   "foto",              limit: 255
    t.integer  "km_actual",         limit: 4
    t.integer  "neumaticos",        limit: 4
    t.date     "fecha_permiso"
    t.date     "fecha_seguro"
    t.date     "fecha_revision"
    t.integer  "ejes",              limit: 4
    t.integer  "horometro_actual",  limit: 4
    t.integer  "anio_compra",       limit: 4
    t.integer  "valor_compra",      limit: 4
    t.string   "modelo",            limit: 255
    t.integer  "hora_minima",       limit: 4
    t.float    "rendimiento_hora",  limit: 24
    t.float    "rendimiento_km",    limit: 24
    t.integer  "tipo_maquina_id",   limit: 4
    t.integer  "estado_maquina_id", limit: 4
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "maquinas", ["estado_maquina_id"], name: "fk_rails_0e564b4a58", using: :btree
  add_index "maquinas", ["tipo_maquina_id"], name: "fk_rails_5102d8ec52", using: :btree

  create_table "mecanicos", force: :cascade do |t|
    t.integer  "rut",              limit: 4
    t.string   "dv",               limit: 255
    t.string   "nombre",           limit: 255
    t.string   "apellido_paterno", limit: 255
    t.string   "apellido_materno", limit: 255
    t.string   "foto",             limit: 255
    t.integer  "jornada",          limit: 4
    t.integer  "valor_hora",       limit: 4
    t.integer  "tipo_mecanico_id", limit: 4
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "mecanicos", ["tipo_mecanico_id"], name: "fk_rails_e6daa2c6b1", using: :btree

  create_table "mecanicos_planificacions", force: :cascade do |t|
    t.integer  "mecanico_id",      limit: 4
    t.integer  "planificacion_id", limit: 4
    t.integer  "horas_mecanico",   limit: 4
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "mecanicos_planificacions", ["mecanico_id"], name: "fk_rails_e67815e418", using: :btree
  add_index "mecanicos_planificacions", ["planificacion_id"], name: "fk_rails_0d41556240", using: :btree

  create_table "multa", force: :cascade do |t|
    t.date     "fecha"
    t.string   "lugar",       limit: 255
    t.text     "descripcion", limit: 65535
    t.integer  "total_multa", limit: 4
    t.integer  "operador_id", limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "operadors", force: :cascade do |t|
    t.integer  "rut",        limit: 4
    t.string   "dv",         limit: 255
    t.string   "nombre",     limit: 255
    t.string   "apellido_p", limit: 255
    t.string   "apellido_m", limit: 255
    t.string   "direccion",  limit: 255
    t.string   "telefono",   limit: 255
    t.string   "foto",       limit: 255
    t.integer  "calzado",    limit: 4
    t.string   "overol",     limit: 255
    t.string   "chaleco",    limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "orden_trabajos", force: :cascade do |t|
    t.text     "detalle",          limit: 65535
    t.date     "fecha"
    t.integer  "planificacion_id", limit: 4
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  add_index "orden_trabajos", ["planificacion_id"], name: "fk_rails_2deefec68e", using: :btree

  create_table "planificacions", force: :cascade do |t|
    t.datetime "fecha_planificacion"
    t.text     "descripcion",         limit: 65535
    t.string   "estado",              limit: 255
    t.string   "tipo",                limit: 255
    t.integer  "horometro",           limit: 4
    t.integer  "kilometraje",         limit: 4
    t.integer  "total_planificacion", limit: 4
    t.integer  "total_hh",            limit: 4
    t.string   "taller_externo",      limit: 255
    t.string   "factura_pendiente",   limit: 255
    t.date     "fecha"
    t.date     "fecha_modificacion"
    t.integer  "maquina_id",          limit: 4
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.integer  "estado_maquina_id",   limit: 4
  end

  add_index "planificacions", ["estado_maquina_id"], name: "fk_rails_da3861be35", using: :btree
  add_index "planificacions", ["maquina_id"], name: "fk_rails_35ee35873a", using: :btree

  create_table "proveedors", force: :cascade do |t|
    t.integer  "rut",        limit: 4
    t.string   "dv",         limit: 255
    t.string   "nombre",     limit: 255
    t.string   "telefono",   limit: 255
    t.string   "email",      limit: 255
    t.text     "direccion",  limit: 65535
    t.text     "giro",       limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "reports", force: :cascade do |t|
    t.string   "nombre",            limit: 255
    t.date     "fecha"
    t.integer  "horas",             limit: 4
    t.integer  "numero",            limit: 4
    t.integer  "arriendo_id",       limit: 4
    t.text     "detalle",           limit: 65535
    t.integer  "horometro_inicial", limit: 4
    t.integer  "horometro_final",   limit: 4
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.integer  "km_inicio",         limit: 4
    t.integer  "km_final",          limit: 4
    t.integer  "operador_id",       limit: 4
  end

  add_index "reports", ["operador_id"], name: "fk_rails_18e3f61899", using: :btree

  create_table "repuestos", force: :cascade do |t|
    t.string   "nombre",           limit: 255
    t.string   "codigo",           limit: 255
    t.integer  "stock",            limit: 4
    t.text     "descripcion",      limit: 65535
    t.integer  "tipo_repuesto_id", limit: 4
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.text     "foto",             limit: 65535
    t.integer  "costo_unidad",     limit: 4
  end

  add_index "repuestos", ["tipo_repuesto_id"], name: "fk_rails_d44f2fdb2e", using: :btree

  create_table "repuestos_planificacions", force: :cascade do |t|
    t.integer  "repuesto_id",      limit: 4
    t.integer  "planificacion_id", limit: 4
    t.integer  "cantidad",         limit: 4
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "repuestos_planificacions", ["planificacion_id"], name: "fk_rails_471300c48a", using: :btree
  add_index "repuestos_planificacions", ["repuesto_id"], name: "fk_rails_f55222dba1", using: :btree

  create_table "tipo_facturas", force: :cascade do |t|
    t.string   "nombre",     limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "tipo_maquinas", force: :cascade do |t|
    t.string   "nombre",     limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "tipo_mecanicos", force: :cascade do |t|
    t.string   "nombre",     limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "tipo_repuestos", force: :cascade do |t|
    t.string   "nombre",     limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_foreign_key "facturas", "maquinas"
  add_foreign_key "facturas", "proveedors"
  add_foreign_key "facturas", "tipo_facturas"
  add_foreign_key "maquinas", "estado_maquinas"
  add_foreign_key "maquinas", "tipo_maquinas"
  add_foreign_key "mecanicos", "tipo_mecanicos"
  add_foreign_key "mecanicos_planificacions", "mecanicos"
  add_foreign_key "mecanicos_planificacions", "planificacions"
  add_foreign_key "orden_trabajos", "planificacions"
  add_foreign_key "planificacions", "estado_maquinas"
  add_foreign_key "planificacions", "maquinas"
  add_foreign_key "reports", "operadors"
  add_foreign_key "repuestos", "tipo_repuestos"
  add_foreign_key "repuestos_planificacions", "planificacions"
  add_foreign_key "repuestos_planificacions", "repuestos"
  # no candidate create_trigger statement could be found, creating an adapter-specific one
  execute(<<-TRIGGERSQL)
CREATE TRIGGER horas_mecanico_planificacion_after_insert_row_tr AFTER INSERT ON `mecanicos_planificacions`
FOR EACH ROW
BEGIN
    UPDATE planificacions SET total_hh = total_hh + NEW.horas_mecanico WHERE planificacions.id = NEW.planificacion_id;
END
  TRIGGERSQL

  # WARNING: generating adapter-specific definition for reports_after_insert_row_tr due to a mismatch.
  # either there's a bug in hairtrigger or you've messed up your migrations and/or db :-/
  execute(<<-TRIGGERSQL)
CREATE TRIGGER reports_after_insert_row_tr AFTER INSERT ON `reports`
FOR EACH ROW
BEGIN
    UPDATE maquinas SET horometro_actual = NEW.horometro_final, km_actual=NEW.km_final WHERE id = (SELECT a.maquina_id FROM arriendos a WHERE a.id = NEW.arriendo_id);
    UPDATE arriendos a SET a.total_arriendo = total_arriendo + NEW.horas*(SELECT valor_hora FROM maquinas WHERE id = a.maquina_id) WHERE a.id = NEW.arriendo_id;
END
  TRIGGERSQL

  create_trigger("planificacions_after_insert_row_tr", :generated => true, :compatibility => 1).
      on("planificacions").
      after(:insert) do
    "UPDATE maquinas SET horometro_actual = NEW.horometro, km_actual=NEW.kilometraje, estado_maquina_id = NEW.estado_maquina_id WHERE id = NEW.maquina_id;"
  end

  create_trigger("repuestos_planificaicon_after_insert_row_tr", :generated => true, :compatibility => 1).
      on("repuestos_planificacions").
      after(:insert) do
    "UPDATE repuestos SET stock = stock - NEW.cantidad WHERE repuestos.id = NEW.repuesto_id;"
  end

end
