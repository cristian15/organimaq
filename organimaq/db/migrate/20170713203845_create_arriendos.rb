class CreateArriendos < ActiveRecord::Migration
  def change
    create_table :arriendos do |t|
      t.date :fecha_arriendo
      t.date :fecha_entrega
      t.text :comentario
      t.float :descuento
      t.integer :total_arriendo
      t.string :nombre_faena
      t.integer :comuna_id
      t.integer :cliente_id
      t.integer :maquina_id
      t.string :estado

      t.timestamps null: false
    end
  end
end
