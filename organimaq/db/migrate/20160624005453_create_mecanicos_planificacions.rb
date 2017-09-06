class CreateMecanicosPlanificacions < ActiveRecord::Migration
  def change
    create_table :mecanicos_planificacions do |t|
      t.integer :mecanico_id
      t.integer :planificacion_id
      t.integer :horas_mecanico

      t.timestamps null: false
    end
  end
end
