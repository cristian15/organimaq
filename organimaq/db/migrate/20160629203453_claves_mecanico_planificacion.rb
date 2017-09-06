class ClavesMecanicoPlanificacion < ActiveRecord::Migration
  def change
  	add_foreign_key :mecanicos_planificacions, :mecanicos
  	add_foreign_key :mecanicos_planificacions, :planificacions
  end
end
