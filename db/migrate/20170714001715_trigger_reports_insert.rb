class TriggerReportsInsert < ActiveRecord::Migration
  def up
    drop_trigger("reports_after_insert_row_tr", "reports", :generated => true)

    create_trigger("reports_after_insert_row_tr", :generated => true, :compatibility => 1).
        on("reports").
        after(:insert) do
      "UPDATE maquinas SET horometro_actual = NEW.horometro_final, km_actual=NEW.km_final WHERE id = (SELECT a.maquina_id FROM arriendos a WHERE a.id = NEW.arriendo_id);
	  UPDATE arriendos a SET a.total_arriendo = total_arriendo + NEW.horas*(SELECT valor_hora FROM maquinas WHERE id = a.maquina_id) WHERE a.id = NEW.arriendo_id;"
    end
  end

  def down
    drop_trigger("reports_after_insert_row_tr", "reports", :generated => true)

    create_trigger("reports_after_insert_row_tr", :generated => true, :compatibility => 1).
        on("reports").
        after(:insert) do
      "UPDATE maquinas SET horometro_actual = NEW.horometro_final, km_actual=NEW.km_final WHERE id = (SELECT a.maquina_id FROM arriendos a WHERE a.id = NEW.arriendo_id);
	  UPDATE arriendos a SET a.total_arriendo = total_arriendo + NEW.horas*(SELECT valor_hora FROM maquinas WHERE id = a.maquina_id) WHERE a.id = NEW.arriendo_id;"
    end
  end
end
