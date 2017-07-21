class Operador < ActiveRecord::Base

	mount_uploader :foto, FotoUploader
	
	def self.search(search)
	  if search
		where("nombre LIKE '%"+search+"%' OR patente LIKE '%"+search+"%'")
	  else
		all
	  end
	end

end
