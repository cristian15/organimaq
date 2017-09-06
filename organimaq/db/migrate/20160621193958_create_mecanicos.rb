class CreateMecanicos < ActiveRecord::Migration
  def change
    create_table :mecanicos do |t|
      t.integer :rut
      t.string :dv
      t.string :nombre
      t.string :apellido_paterno
      t.string :apellido_materno
      t.string :foto
      t.integer :jornada
      t.integer :valor_hora
      t.integer :tipo_mecanico_id

      t.timestamps null: false
    end
  end
end
