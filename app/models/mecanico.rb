class Mecanico < ActiveRecord::Base
	has_one :tipo_mecanicos

	has_many :mecanicosplanificacions

	mount_uploader :foto, FotoUploader		# agrega el upload, para subir archivo


end
