class CreateFuenteCombustibles < ActiveRecord::Migration
  def change
    create_table :fuente_combustibles do |t|
      t.float :litros_combustible
      t.float :capacidad
      t.string :codigo
      t.string :nombre

      t.timestamps null: false
    end
  end
end
