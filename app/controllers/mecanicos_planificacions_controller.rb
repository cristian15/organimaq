class MecanicosPlanificacionsController < ApplicationController
  
respond_to :html, :json
  
  def index
  	@mecanicos_planificacion = MecanicosPlanificacion.all
  end

  def edit
	@mecanicos_planificacion = MecanicosPlanificacion.find(params[:id])
	@mecanico = Mecanicos.find(params[:mecanico_id])
  end

  def show
	@mecanicos_planificacion = MecanicosPlanificacion.find(params[:id])
	
  end

  def new
  	@mecanicos_planificacion = MecanicosPlanificacion.new
	respond_modal_with @mecanicos_planificacion
	
  end

  def create
		
		@mecanicos_planificacion = MecanicosPlanificacion.new(mecanicos_planificacion_params);
		@mecanicos_planificacion.save
		respond_modal_with @mecanicos_planificacion, location: edit_planificacion_path(Planificacion.find(params[:mecanicos_planificacion][:planificacion_id]))
		
		#if @mecanicos_planificacion.save
		#	redirect_to edit_planificacion_path(Planificacion.find(params[:mecanicos_planificacion][:planificacion_id]))
		#else
		#	render 'new'
		#end
	end

  private
    def mecanicos_planificacion_params
      params.require(:mecanicos_planificacion).permit(:planificacion_id, :mecanico_id, :horas_mecanico)

    end
end
