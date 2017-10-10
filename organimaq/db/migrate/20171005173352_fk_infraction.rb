class FkInfraction < ActiveRecord::Migration
  def change
	add_foreign_key :infractions, :operadors
  end
end
