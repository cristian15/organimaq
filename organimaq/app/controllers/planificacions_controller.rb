class PlanificacionsController < ApplicationController

	helper_method :sort_column, :sort_direction
	
	before_action :clear_search_index, :only => [:index]

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
	
	@search = Repuesto.joins("INNER JOIN repuestos_planificacions on repuesto_id = repuestos.id AND planificacion_id = ", params[:id]).ransack(params[:q])
	@repuestos = @search.result.paginate(page: params[:page], per_page:4)
	@RepuestoPla = RepuestosPlanificacion.joins("INNER JOIN repuestos on repuesto_id = repuestos.id AND planificacion_id = ", params[:id])
	
	@orden_trabajos = OrdenTrabajo.where("planificacion_id ="+params[:id])
	
	
	@search_factura = Factura.joins("INNER JOIN planificacion_facturas on factura_id = facturas.id AND planificacion_id =", params[:id]).ransack(params[:q])
	
	@facturas = @search_factura.result.paginate(page: params[:page_facturas], per_page:2)
	
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
