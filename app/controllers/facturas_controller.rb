class FacturasController < ApplicationController

	before_action :clear_search_index, :only => [:index]
	$plan_id = nil			# variable global para la id planificacion
	
  def index
	@search = Factura.ransack(params[:q])
	@factura = @search.result.paginate(page: params[:page], per_page:5)
  end

  def show
	@factura = Factura.find(params[:id])
  end

  def edit
	@factura = Factura.find(params[:id])
  end

  def new
	@factura = Factura.new
	if params[:pl] != nil		# si viene desde planificacion edit
		$plan_id = params[:pl]
	end
  end
  
  def create
  	@factura = Factura.new(factura_params)
	
	if $plan_id != nil
		@factura.save		# guarda la factura
		@plani = PlanificacionFactura.new(planificacion_id: $plan_id, factura_id: @factura.id)	# Crea objeto de la tabla relacion
		@plani.save
		redirect_to edit_planificacion_path($plan_id)
	
	else	
		if @factura.save
			redirect_to @factura
		else
			render 'new'
		end
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
