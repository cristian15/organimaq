class TriggerCantidadRepuestoPlanificacion < ActiveRecord::Migration
  def up
    drop_trigger("repuestos_planificaicon_after_insert_row_tr", "reports", :generated => true)

    create_trigger("repuestos_planificaicon_after_insert_row_tr", :generated => true, :compatibility => 1).
        on("repuestos_planificacions").
        after(:insert) do
      "UPDATE repuestos SET stock = stock - NEW.cantidad WHERE repuestos.id = NEW.repuesto_id;"
    end
  end

  def down
    drop_trigger("repuestos_planificaicon_after_insert_row_tr", "reports", :generated => true)

    create_trigger("repuestos_planificaicon_after_insert_row_tr", :generated => true, :compatibility => 1).
        on("repuestos_planificacions").
        after(:insert) do
      "UPDATE repuestos SET stock = stock - NEW.cantidad WHERE repuestos.id = NEW.repuesto_id;"
    end
  end
end
