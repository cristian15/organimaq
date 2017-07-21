class CreateInfractions < ActiveRecord::Migration
  def change
    create_table :infractions do |t|
      t.date :fecha
      t.string :lugar
      t.text :descripcion
      t.integer :total_multa
      t.integer :operador_id

      t.timestamps null: false
    end
  end
end
