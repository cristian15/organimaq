class TriggerEliminaArriendosClientes < ActiveRecord::Migration
  def up
    drop_trigger("elimina_arriendos_after_delete_row_tr", "clientes", :generated => true)

    create_trigger("elimina_arriendos_after_delete_row_tr", :generated => true, :compatibility => 1).
        on("clientes").
        after(:delete) do
      "DELETE FROM arriendos WHERE cliente_id=OLD.id;"
    end
  end

  def down
    drop_trigger("elimina_arriendos_after_delete_row_tr", "clientes", :generated => true)

    create_trigger("elimina_arriendos_after_delete_row_tr", :generated => true, :compatibility => 1).
        on("clientes").
        after(:delete) do
      "DELETE FROM arriendos WHERE cliente_id=OLD.id;"
    end
  end
end
