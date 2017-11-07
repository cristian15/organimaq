class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :usuario
      t.string :password_hash
      t.string :password_salt
      t.string :nombre
      t.string :email
	  
	  t.integer :tipo_user_id
	 

      t.timestamps null: false
    end
  end
end
