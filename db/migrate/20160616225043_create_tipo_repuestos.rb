class CreateTipoRepuestos < ActiveRecord::Migration
  def change
    create_table :tipo_repuestos do |t|
      t.string :nombre

      t.timestamps null: false
    end
  end
end
