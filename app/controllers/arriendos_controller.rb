class ArriendosController < ApplicationController
  def new
	@arriendo = Arriendo.new
  end

  def index
	@arriendo = Arriendo.all
  end

  def show
	@arriendo = Arriendo.find(params[:id])
  end

  def edit
	@arriendo = Arriendo.find(params[:id])
	@report = Report.joins('INNER JOIN arriendos ON arriendo_id = arriendos.id AND arriendos.id =', params[:id])
  end
  
  def destroy
  end
  
  def create
  	@arriendo = Arriendo.new(arriendo_params)
  	if @arriendo.save
  		redirect_to @arriendo
  	else
  		render 'new'
  	end
  end
  
  private
  	def arriendo_params
  		params.require(:arriendo).permit(:fecha_arriendo, :fecha_entrega, :comentario, :descuento, :total_arriendo, :nombre_faena, :comuna_id, :cliente_id, :maquina_id, :estado)
  	end
  
end
