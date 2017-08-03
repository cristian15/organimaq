class CreateFacturas < ActiveRecord::Migration
  def change
    create_table :facturas do |t|
      t.string :numero
      t.text :descripcion
      t.date :fecha
      t.integer :total
      t.integer :maquina_id
      t.integer :tipo_factura_id
      t.integer :proveedor_id
      t.integer :neto
      t.string :foto

      t.timestamps null: false
    end
	
	add_foreign_key :facturas, :tipo_facturas
	add_foreign_key :facturas, :proveedors
	add_foreign_key :facturas, :maquinas
  end
end
