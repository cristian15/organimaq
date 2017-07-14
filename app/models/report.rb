class Report < ActiveRecord::Base
	has_one :arriendos
	
	trigger.after(:insert) do
    "UPDATE maquinas SET horometro_actual = NEW.horometro_final, km_actual=NEW.km_final WHERE id = (SELECT a.maquina_id FROM arriendos a WHERE a.id = NEW.arriendo_id);"
	end
end
