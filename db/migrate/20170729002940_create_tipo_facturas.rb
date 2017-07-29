class CreateTipoFacturas < ActiveRecord::Migration
  def change
    create_table :tipo_facturas do |t|
      t.string :nombre

      t.timestamps null: false
    end
  end
end
