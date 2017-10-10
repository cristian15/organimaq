class Report < ActiveRecord::Base
	has_one :arriendos
	has_one :operadors
	
	acts_as_xlsx
	
	trigger.after(:insert) do
    "UPDATE maquinas SET horometro_actual = NEW.horometro_final, km_actual=NEW.km_final WHERE id = (SELECT a.maquina_id FROM arriendos a WHERE a.id = NEW.arriendo_id);"
	end
	
	
	
end
