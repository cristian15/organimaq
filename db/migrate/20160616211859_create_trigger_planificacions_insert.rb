# This migration was auto-generated via `rake db:generate_trigger_migration'.
# While you can edit this file, any changes you make to the definitions here
# will be undone by the next auto-generated trigger migration.

class CreateTriggerPlanificacionsInsert < ActiveRecord::Migration
  def up
    drop_trigger("planificacions_after_insert_row_tr", "planificacions", :generated => true)

    create_trigger("planificacions_after_insert_row_tr", :generated => true, :compatibility => 1).
        on("planificacions").
        after(:insert) do
      "UPDATE maquinas SET horometro_actual = NEW.horometro, km_actual=NEW.kilometraje, estado_maquina_id = NEW.estado_maquina_id WHERE id = NEW.maquina_id;"
    end
  end

  def down
    drop_trigger("planificacions_after_insert_row_tr", "planificacions", :generated => true)

    create_trigger("planificacions_after_insert_row_tr", :generated => true, :compatibility => 1).
        on("planificacions").
        after(:insert) do
      "UPDATE maquinas SET horometro_actual = NEW.horometro, km_actual=NEW.kilometraje WHERE id = NEW.maquina_id;"
    end
  end
end
