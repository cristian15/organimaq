class CreateOperadors < ActiveRecord::Migration
  def change
    create_table :operadors do |t|
      t.integer :rut
      t.string :dv
      t.string :nombre
      t.string :apellido_p
      t.string :apellido_m
      t.string :direccion
      t.string :telefono
      t.string :foto
      t.integer :calzado
      t.string :overol
      t.string :chaleco

      t.timestamps null: false
    end
  end
end
