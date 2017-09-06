class Planificacion < ActiveRecord::Base
	has_one :maquinas

	has_many :mecanicosplanificacions
	
	belongs_to :orden_trabajos
	
	has_many :planificacionfacturas

	trigger.after(:insert) do
    "UPDATE maquinas SET horometro_actual = NEW.horometro, km_actual=NEW.kilometraje, estado_maquina_id = NEW.estado_maquina_id WHERE id = NEW.maquina_id;"

  end
  
  def self.search(search)
	  if search
		where("nombre LIKE '%"+search+"%' OR patente LIKE '%"+search+"%'")
	  else
		all
	  end
	end
  
  def start_time
  	self.fecha
  end

end
