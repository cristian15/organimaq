class TipoFacturasController < ApplicationController
  def index
  end

  def new
	@tipo_factura = TipoFactura.new
  end
  
  def edit
  	@tipo_factura = TipoFactura.find(params[:id])
  end
  
  def create
		@tipo_factura = TipoFactura.new(tipo_factura_params)
		if @tipo_factura.save
			redirect_to tipo_facturas_path(), notice: "Tipo Maquinaria '#{@tipo_factura.nombre}' ha sido Agregado."
		else
			render 'new'
		end
	end
	
	def destroy
  	@tipo_factura = TipoFactura.find(params[:id])

  	if @tipo_factura.destroy
  	 redirect_to tipo_facturas_path(), notice: "Tipo Maquinaria '#{@tipo_factura.nombre}' ha sido elminada."
    else
      redirect_to tipo_facturas_path(), notice: "Error al eliminar '#{@tipo_maquina.nombre}'."
    end
  end
  
  def update
		@tipo_factura = TipoFactura.find(params[:id])

		if @tipo_factura.update(tipo_factura_params)
			redirect_to tipo_facturas_path(), notice: "Tipo Maquinaria '#{@tipo_factura.nombre}' ha sido Actualizado."
  
		else
			render 'edit'
		end
	end
	
	private
		def tipo_factura_params
			params.require(:tipo_factura).permit(:nombre)
		end
end
