class MecanicosPlanificacion < ActiveRecord::Base

	belongs_to :mecanicos
	belongs_to :planificacions
end
