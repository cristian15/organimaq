class CreateProveedors < ActiveRecord::Migration
  def change
    create_table :proveedors do |t|
      t.integer :rut
      t.string :dv
      t.string :nombre
      t.string :telefono
      t.string :email
      t.text :direccion
      t.text :giro

      t.timestamps null: false
    end
  end
end
