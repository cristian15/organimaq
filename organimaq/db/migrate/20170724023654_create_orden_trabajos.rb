class CreateOrdenTrabajos < ActiveRecord::Migration
  def change
    create_table :orden_trabajos do |t|
      t.text :detalle
      t.date :fecha
      t.integer :planificacion_id

      t.timestamps null: false
    end
	
	add_foreign_key :orden_trabajos, :planificacions
  end
end
