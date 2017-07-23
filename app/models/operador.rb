class Operador < ActiveRecord::Base
	belongs_to :report

	mount_uploader :foto, FotoUploader
	
	def self.search(search)
	  if search
		where("nombre LIKE '%"+search+"%' OR patente LIKE '%"+search+"%'")
	  else
		all
	  end
	end

end
