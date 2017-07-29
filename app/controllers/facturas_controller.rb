class FacturasController < ApplicationController
  def index
	@factura = Factura.all
  end

  def show
	@factura = Factura.find(params[:id])
  end

  def edit
	@factura = Factura.find(params[:id])
  end

  def new
	@factura = Factura.new
  end
  
  def create
  	@factura = Factura.new(factura_params)
  	if @factura.save
  		redirect_to @factura
  	else
  		render 'new'
  	end
  end
  
	def destroy
	@factura = Factura.find(params[:id])

		if @factura.destroy
		  redirect_to maquina_path(@factura.maquina_id), notice: "Factura No.'#{@factura.numero}' ha sido elminado."
		else
		  redirect_to maquina_path(@factura.maquina_id), notice: "Error al eliminar Factura No.'#{@factura.numero}'."
		end
	end
	
	def update
		@factura = Factura.find(params[:id])

		if @factura.update(factura_params)
			redirect_to maquina_path(@factura.maquina_id), notice: "Factura No.'#{@factura.numero}' ha sido actualizada."
		else
			render 'edit'
		end
	end
  
  
  private
  	def factura_params
  		params.require(:factura).permit(:numero, :descripcion, :fecha, :total, :maquina_id, :tipo_factura_id, :proveedor_id, :neto, :foto)
  	end
end
