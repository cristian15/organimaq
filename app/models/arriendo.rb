class Arriendo < ActiveRecord::Base
	has_one :maquinas
	
	has_one :clientes
	belongs_to :report
	
	def self.search(search)
	  if search
		where("nombre LIKE '%"+search+"%' OR patente LIKE '%"+search+"%'")
	  else
		all
	  end
	end
	
end
