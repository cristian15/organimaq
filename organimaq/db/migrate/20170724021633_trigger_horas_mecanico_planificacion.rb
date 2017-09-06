class TriggerHorasMecanicoPlanificacion < ActiveRecord::Migration
  def up
    drop_trigger("horas_mecanico_planificacion_after_insert_row_tr", "reports", :generated => true)

    create_trigger("horas_mecanico_planificaicon_after_insert_row_tr", :generated => true, :compatibility => 1).
        on("mecanicos_planificacions").
        after(:insert) do
      "UPDATE planificacions SET total_hh = total_hh + NEW.horas_mecanico WHERE planificacions.id = NEW.planificacion_id;"
    end
  end

  def down
    drop_trigger("horas_mecanico_planificacion_after_insert_row_tr", "reports", :generated => true)

    create_trigger("horas_mecanico_planificaicon_after_insert_row_tr", :generated => true, :compatibility => 1).
        on("mecanicos_planificacions").
        after(:insert) do
      "UPDATE planificacions SET total_hh = total_hh + NEW.horas_mecanico WHERE planificacions.id = NEW.planificacion_id;"
    end
  end
end
