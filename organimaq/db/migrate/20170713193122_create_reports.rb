class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.string :nombre
      t.date :fecha
      t.integer :horas
      t.integer :numero
      t.integer :arriendo_id
      t.text :detalle
      t.integer :horometro_inicial
      t.integer :horometro_final

      t.timestamps null: false
    end
  end
end
