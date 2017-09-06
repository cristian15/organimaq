class OrdenTrabajosController < ApplicationController
  
  respond_to :html, :json
  def index
  end

  def show
  end

  def new
	@orden_trabajo = OrdenTrabajo.new
	respond_modal_with @orden_trabajo
  end

  def edit
  end
  
  def create
		
		@orden_trabajo = OrdenTrabajo.new(orden_trabajo_params);
		@orden_trabajo.save
		respond_modal_with @orden_trabajo, location: edit_planificacion_path(Planificacion.find(params[:orden_trabajo][:planificacion_id]))
		#if @orden_trabajo.save
		#	redirect_to edit_planificacion_path(Planificacion.find(params[:orden_trabajo][:planificacion_id]))
		#else
		#	render 'new'
		#end
	end

  private
    def orden_trabajo_params
      params.require(:orden_trabajo).permit(:planificacion_id, :fecha, :detalle)

    end
end
