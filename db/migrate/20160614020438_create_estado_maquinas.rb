class CreateEstadoMaquinas < ActiveRecord::Migration
  def change
    create_table :estado_maquinas do |t|
      t.string :nombre

      t.timestamps null: false
    end
  end
end
