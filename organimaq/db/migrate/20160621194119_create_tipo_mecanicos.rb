class CreateTipoMecanicos < ActiveRecord::Migration
  def change
    create_table :tipo_mecanicos do |t|
      t.string :nombre

      t.timestamps null: false
    end
  end
end
