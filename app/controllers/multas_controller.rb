class MultasController < ApplicationController
  def index
	@multa = Multa.all
  end

  def new
	@multas = Multa.new
	@operador = Operador.find(params[:id])
  end

  def show
	@multa = Multa.find(params[:id])
  end

  def edit
	@multa = Multa.find(params[:id])
  end
  
  def create
  	@multa = Multa.new(report_params)
  	if @multa.save
  		redirect_to operador_path(@multa.operador_id)
  	else
  		render 'new'
  	end
  end
  
  def update
	@multa = Multa.find(params[:id])
	if @multa.update(multa_params)
		redirect_to show_operadors_path(@multa.operador_id), notice: "La multa ha sido Actualizada."
	else
		render 'edit'
	end
  end
  
  def destroy
    @multa = Multa.find(params[:id])

    if @multa.destroy
     redirect_to edit_operadors_path(@multa.operador_id), notice: " 'La multa ha sido elminada."
    else
      redirect_to edit_operadors_path(@multa.operador_id), notice: "Error al eliminar."
    end
  end
  
  private
  	def report_params
  		params.require(:multa).permit(:fecha, :lugar, :descripcion, :total_multa, :operador_id)
  	end
  
  
end
