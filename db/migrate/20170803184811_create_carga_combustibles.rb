class CreateCargaCombustibles < ActiveRecord::Migration
  def change
    create_table :carga_combustibles do |t|
      t.integer :maquina_id
      t.integer :fuente_combustible_id
      t.float :litros_cargados
      t.integer :horometro
      t.integer :kilometraje
      t.date :fecha
      t.text :lugar
      t.integer :numero_report

      t.timestamps null: false
    end
	
	add_foreign_key :carga_combustibles, :maquinas
	add_foreign_key :carga_combustibles, :fuente_combustibles
	
  end
end
