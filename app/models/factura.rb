class Factura < ActiveRecord::Base

	has_one :tipo_facturas
	has_one :proveedors
	has_one :maquinas
	
	has_many :planificacionfacturas
	
	mount_uploader :foto, FotoUploader		# agrega el upload, para subir archivo
	
	
	
end
