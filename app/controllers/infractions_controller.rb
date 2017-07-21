class InfractionsController < ApplicationController
  def index
	@infraction = Infraction.all
  end

  def new
	@infraction = Infraction.new
	@operador = Operador.find(params[:id])
  end

  def show
	@infraction = Infraction.find(params[:id])
  end

  def edit
	@infraction = Infraction.find(params[:id])
  end
  
  def create
  	@infraction = Infraction.new(infraction_params)
  	if @infraction.save
  		redirect_to operador_path(@infraction.operador_id)
  	else
  		render 'new'
  	end
  end
  
  def update
	@infraction = Infraction.find(params[:id])
	if @infraction.update(infraction_params)
		redirect_to operador_path(@infraction.operador_id), notice: "La multa ha sido Actualizada."
	else
		render 'edit'
	end
  end
  
  def destroy
    @infraction = Infraction.find(params[:id])

    if @infraction.destroy
     redirect_to operador_path(@infraction.operador_id), notice: "La multa ha sido elminada."
    else
      redirect_to operador_path(@infraction.operador_id), notice: "Error al eliminar."
    end
  end
  
  private
  	def infraction_params
  		params.require(:infraction).permit(:fecha, :lugar, :descripcion, :total_multa, :operador_id)
  	end
end
