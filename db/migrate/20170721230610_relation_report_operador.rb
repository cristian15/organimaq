class RelationReportOperador < ActiveRecord::Migration
  def change
  
	add_column :reports, :operador_id, :integer
	add_foreign_key :reports, :operadors
  end
end
