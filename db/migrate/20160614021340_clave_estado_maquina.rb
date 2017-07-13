class ClaveEstadoMaquina < ActiveRecord::Migration
  def change
  	
  	add_foreign_key :maquinas, :estado_maquinas
  end
end
