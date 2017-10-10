class Arriendo < ActiveRecord::Base
	acts_as_xlsx
	has_one :maquinas
	
	has_one :clientes, :dependent => :destroy
	belongs_to :report
	
	
	
	
end
