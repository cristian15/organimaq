class ClavePlanificacion < ActiveRecord::Migration
  def change

  	add_foreign_key :planificacions, :maquinas

  end
end
