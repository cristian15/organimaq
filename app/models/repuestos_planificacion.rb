class RepuestosPlanificacion < ActiveRecord::Base
	belongs_to :repuestos
	belongs_to :planificacions
end
