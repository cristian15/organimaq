class AtributoCostoRepuesto < ActiveRecord::Migration
  def change
	add_column :repuestos, :costo_unidad, :integer
  end
end
