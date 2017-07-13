class CreatePlanificacions < ActiveRecord::Migration
  def change
    create_table :planificacions do |t|
      t.datetime :fecha_planificacion
      t.text :descripcion
      t.string :estado
      t.string :tipo
      t.integer :horometro
      t.integer :kilometraje
      t.integer :total_planificacion
      t.integer :total_hh
      t.string :taller_externo
      t.string :factura_pendiente
      t.date :fecha
      t.date :fecha_modificacion

      t.integer :maquina_id

      t.timestamps null: false
    end
  end
end
