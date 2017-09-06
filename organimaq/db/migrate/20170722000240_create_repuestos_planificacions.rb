class CreateRepuestosPlanificacions < ActiveRecord::Migration
  def change
    create_table :repuestos_planificacions do |t|
      t.integer :repuesto_id
      t.integer :planificacion_id
	  t.integer :cantidad

      t.timestamps null: false
    end
	
	add_foreign_key :repuestos_planificacions, :repuestos
	add_foreign_key :repuestos_planificacions, :planificacions
  end
end
