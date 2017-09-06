class PlanificacionEstado < ActiveRecord::Migration
  def change

  	add_column :planificacions, :estado_maquina_id, :integer

  	add_foreign_key :planificacions, :estado_maquinas
  end
end
