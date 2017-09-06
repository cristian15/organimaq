class TriggerCargaCombustible < ActiveRecord::Migration
   def up
    drop_trigger("horometro_km_after_insert_row_tr", "carga_combustibles", :generated => true)

    create_trigger("horometro_km_after_insert_row_tr", :generated => true, :compatibility => 1).
        on("carga_combustibles").
        after(:insert) do
      "UPDATE maquinas SET km_actual = NEW.kilometraje, horometro_actual = NEW.horometro WHERE maquinas.id = NEW.maquina_id; UPDATE fuente_combustibles SET litros_combustible = litros_combustible - NEW.litros_cargados WHERE fuente_combustibles.id = NEW.fuente_combustible_id;"
    end
  end

  def down
    drop_trigger("horometro_km_after_insert_row_tr", "carga_combustibles", :generated => true)

    create_trigger("horometro_km_after_insert_row_tr", :generated => true, :compatibility => 1).
        on("carga_combustibles").
        after(:insert) do
      "UPDATE maquinas SET km_actual = NEW.kilometraje, horometro_actual = NEW.horometro WHERE maquinas.id = NEW.maquina_id; UPDATE fuente_combustibles SET litros_combustible = litros_combustible - NEW.litros_cargados WHERE fuente_combustibles.id = NEW.fuente_combustible_id;"
    end
  end
end
