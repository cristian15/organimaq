class RepuestoFoto < ActiveRecord::Migration
  def change

  	add_column :repuestos, :foto, :text
  end
end
