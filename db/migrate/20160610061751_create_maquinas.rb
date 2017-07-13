class CreateMaquinas < ActiveRecord::Migration
  def change
    create_table :maquinas do |t|
      t.string :codigo
      t.string :chasis
      t.string :motor
      t.string :patente
      t.string :marca
      t.integer :valor_hora
      t.integer :valor_dia
      t.integer :anio
      t.string :nombre
      t.string :foto
      t.integer :km_actual
      t.integer :neumaticos
      t.date :fecha_permiso
      t.date :fecha_seguro
      t.date :fecha_revision
      t.integer :ejes
      t.integer :horometro_actual
      t.integer :anio_compra
      t.integer :valor_compra
      t.string :modelo
      t.integer :hora_minima
      t.float :rendimiento_hora
      t.float :rendimiento_km

      t.integer :tipo_maquina_id
      t.integer :estado_maquina_id

      t.timestamps null: false


    end

    
  end
end
