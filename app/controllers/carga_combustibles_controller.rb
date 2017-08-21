class CargaCombustiblesController < ApplicationController
  respond_to :html, :json			# para modals
  
  
  def index
	@carga = CargaCombustible.all
  end
  
  def new
	@carga = CargaCombustible.new
	@maquina = Maquina.find(params[:id])
	respond_modal_with @carga
  end
  
  
  def create
	@carga = CargaCombustible.new(carga_combustible_params)
	@carga.save
	respond_modal_with @carga, location: maquina_path(@carga.maquina_id)
	
  end
  
  def destroy
		@carga = CargaCombustible.find(params[:id])
		@carga.destroy
		redirect_to maquina_path(@carga.maquina_id), notice_cargas: "Carga Nº #{@carga.numero_report} ha sido elminada."
  end
  
  
  private
  	def carga_combustible_params
  		params.require(:carga_combustible).permit(:fecha, :lugar, :maquina_id, :litros_cargados, :horometro, :kilometraje, :numero_report, :fuente_combustible_id)
  	end
end
