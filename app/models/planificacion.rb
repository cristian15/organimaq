class Planificacion < ActiveRecord::Base
	has_one :maquinas

	has_many :mecanicosplanificacions

	trigger.after(:insert) do
    "UPDATE maquinas SET horometro_actual = NEW.horometro, km_actual=NEW.kilometraje, estado_maquina_id = NEW.estado_maquina_id WHERE id = NEW.maquina_id;"

  end
  
  def start_time
  	self.fecha
  end

end
