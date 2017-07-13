class TipoMecanicoMecanico < ActiveRecord::Migration
  def change
  	add_foreign_key :mecanicos, :tipo_mecanicos
  end
end
