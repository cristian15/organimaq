class Maquina < ActiveRecord::Base
	acts_as_xlsx
	has_one :tipo_maquinas
	has_one :estado_maquinas
	belongs_to :planificacions
	belongs_to :facturas

	
	mount_uploader :foto, FotoUploader		# agrega el upload, para subir archivo

	
end
