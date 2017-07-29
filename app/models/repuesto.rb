class Repuesto < ActiveRecord::Base

	has_one :tipo_repuestos

	mount_uploader :foto, FotoUploader		# agrega el upload, para subir archivo
	
	def self.search(search)
	  if search
		where("nombre LIKE '%"+search+"%' OR patente LIKE '%"+search+"%'")
	  else
		all
	  end
	end

end
