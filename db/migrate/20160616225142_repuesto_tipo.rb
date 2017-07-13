class RepuestoTipo < ActiveRecord::Migration
  def change

  	add_foreign_key :repuestos, :tipo_repuestos
  end
end
