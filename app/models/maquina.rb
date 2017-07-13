class Maquina < ActiveRecord::Base
	has_one :tipo_maquinas
	has_one :estado_maquinas
	belongs_to :planificacions

	
	mount_uploader :foto, FotoUploader		# agrega el upload, para subir archivo

end
