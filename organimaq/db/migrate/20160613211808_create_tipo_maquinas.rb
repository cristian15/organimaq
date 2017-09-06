class CreateTipoMaquinas < ActiveRecord::Migration
  def change
    create_table :tipo_maquinas do |t|
      t.string :nombre

      t.timestamps null: false
    end
  end
end
