class KmReports < ActiveRecord::Migration
  def change
  
	add_column :reports, :km_inicio, :integer
	add_column :reports, :km_final, :integer
  
  end
end
