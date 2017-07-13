class CreateClientes < ActiveRecord::Migration
  def change
    create_table :clientes do |t|
      t.integer :rut_cliente
      t.string :dv
      t.string :nombre
      t.text :direccion
      t.string :nombre_contacto
      t.string :telefono
      t.string :mail
      t.string :giro

      t.timestamps null: false
    end
  end
end
