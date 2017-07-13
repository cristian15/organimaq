class ClaveForaneaMaquina < ActiveRecord::Migration
  def change
  	
  	add_foreign_key :maquinas, :tipo_maquinas


  end
end
