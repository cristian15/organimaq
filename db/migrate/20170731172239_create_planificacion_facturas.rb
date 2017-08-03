class CreatePlanificacionFacturas < ActiveRecord::Migration
  def change
    create_table :planificacion_facturas do |t|
      t.integer :planificacion_id
      t.integer :factura_id

      t.timestamps null: false
    end
	
	add_foreign_key :planificacion_facturas, :facturas
	add_foreign_key :planificacion_facturas, :planificacions
  end
end
