class ArriendosController < ApplicationController

	
  def new
	@arriendo = Arriendo.new
  end

  def index
	@search = Arriendo.ransack(params[:q])
	@arriendo = @search.result.paginate(page: params[:page], per_page:2)
  end

  def show
	@arriendo = Arriendo.find(params[:id])
	
	@search = Report.joins('INNER JOIN arriendos ON arriendo_id = arriendos.id AND arriendos.id =', params[:id]).ransack(params[:q])
	@report = @search.result.paginate(page: params[:page], per_page:2)
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
  
  def update
  	@arriendo = Arriendo.find(params[:id])
  	if @arriendo.update(arriendo_params)
  		redirect_to arriendos_path(), notice: "Arriendo #{@arriendo.fecha_arriendo} ha sido Actualizada."
  	else
  		render 'new'
  	end
  end
  
  private
  	def arriendo_params
  		params.require(:arriendo).permit(:fecha_arriendo, :fecha_entrega, :comentario, :descuento, :total_arriendo, :nombre_faena, :comuna_id, :cliente_id, :maquina_id, :estado)
  	end
	
	
end
