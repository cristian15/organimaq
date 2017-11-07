class CreateTipoUsers < ActiveRecord::Migration
  def change
    create_table :tipo_users do |t|
      t.string :nombre

      t.timestamps null: false
    end
	
	add_foreign_key :users, :tipo_users
  end
  
  
end
