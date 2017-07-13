class PlanificacionsController < ApplicationController
  def index
    @planificacions = Planificacion.all
	
  end

  def show
    @planificacion = Planificacion.find(params[:id])
  end

  def edit
    @planificacion = Planificacion.find(params[:id])
	# lista de mecanicos agregados a la planificacion
	@mecanico = Mecanico.joins("INNER JOIN mecanicos_planificacions on mecanico_id = mecanicos.id AND planificacion_id = ", params[:id])
	@pla = MecanicosPlanificacion.joins("INNER JOIN mecanicos on mecanico_id = mecanicos.id AND planificacion_id = ", params[:id])
  end

  def new
    @planificacion = Planificacion.new
  end

  def destroy
  end

  def create
    @planificacion = Planificacion.new(planificacion_params)
    if @planificacion.save
      redirect_to @planificacion
    else
      render 'new'
    end
  end

  def update
    @planificacion = Planificacion.find(params[:id])

    if @planificacion.update(planificacion_params)
      redirect_to planificacion_path, notice: "Planificacion Actualizada."
    else
      render 'edit'
    end
  end


  private
    def planificacion_params
      params.require(:planificacion).permit(:fecha_planificacion,:descripcion,:estado,:tipo,:horometro,:kilometraje,:total_planificacion,:total_hh,:taller_externo,:factura_pendiente,:fecha,:fecha_modificacion,:maquina_id, :estado_maquina_id)

    end
end
