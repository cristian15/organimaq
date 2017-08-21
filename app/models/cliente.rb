class Cliente < ActiveRecord::Base

	belongs_to :arriendos, :dependent => :destroy
end
