class CreateEstanqueFijos < ActiveRecord::Migration
  def change
    create_table :estanque_fijos do |t|
      t.string :nombre
      t.string :codigo
      t.float :capacidad
      t.float :litros_actual
      t.string :ubicacion

      t.timestamps null: false
    end
  end
end
