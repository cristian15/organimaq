class FkArriendos < ActiveRecord::Migration
  def change
	add_foreign_key :arriendos, :maquinas
	add_foreign_key :arriendos, :clientes
	
  end
end
