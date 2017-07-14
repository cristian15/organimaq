class Arriendo < ActiveRecord::Base
	has_one :maquinas
	
	has_one :clientes
	
end
