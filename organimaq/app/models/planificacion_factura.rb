class PlanificacionFactura < ActiveRecord::Base
	belongs_to :planificacions
	belongs_to :facturas
end
