class CreateRepuestos < ActiveRecord::Migration
  def change
    create_table :repuestos do |t|
      t.string :nombre
      t.string :codigo
      t.integer :stock
      t.text :descripcion
      t.integer :tipo_repuesto_id

      t.timestamps null: false
    end
  end
end
