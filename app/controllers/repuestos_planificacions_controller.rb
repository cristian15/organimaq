class RepuestosPlanificacionsController < ApplicationController
  def index
  	@repuestos_planificacion = RepuestosPlanificacion.all
  end

  def edit
	@repuestos_planificacion = RepuestosPlanificacion.find(params[:id])
	@repuesto = Mecanicos.find(params[:mecanico_id])
  end

  def show
	@repuestos_planificacion = RepuestosPlanificacion.find(params[:id])
	
  end

  def new
  	@repuestos_planificacions = RepuestosPlanificacion.new
	
  end

  def create
		
		@repuestos_planificacions = RepuestosPlanificacion.new(repuestos_planificacion_params);

		if @repuestos_planificacions.save
			redirect_to edit_planificacion_path(Planificacion.find(params[:repuestos_planificacion][:planificacion_id]))
		else
			render 'new'
		end
	end

  private
    def repuestos_planificacion_params
      params.require(:repuestos_planificacion).permit(:planificacion_id, :repuesto_id, :cantidad)

    end
end
