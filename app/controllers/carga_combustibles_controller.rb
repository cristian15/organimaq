class CargaCombustiblesController < ApplicationController
  respond_to :html, :json			# para modals
  
  
  def
	@carga_combustibles = CargaCombustible.all
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
  
  
  private
  	def carga_combustible_params
  		params.require(:carga_combustible).permit(:fecha, :lugar, :maquina_id, :litros_cargados, :horometro, :kilometraje, :numero_report, :fuente_combustible_id)
  	end
end
