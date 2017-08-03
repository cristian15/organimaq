class EstanqueFijosController < ApplicationController

	before_action :clear_search_index, :only => [:index]

  def index
	@search = EstanqueFijo.ransack(params[:q])
	@estanque_fijo = @search.result.paginate(page: params[:page], per_page:2)
  end

  def new
	@estanque_fijo = EstanqueFijo.new
  end

  def edit
	@estanque_fijo = EstanqueFijo.find(params[:id])
  end

  def show
	@estanque_fijo = EstanqueFijo.find(params[:id])
  end
  
    def create
		@estanque_fijo = EstanqueFijo.new(estanque_fijo_params)
		if @estanque_fijo.save
			redirect_to estanque_fijos_path(), notice: "Estanque '#{@estanque_fijo.nombre}' ha sido Agregado."
		else
			render 'new'
		end
	end
	
	def update
		@estanque_fijo = EstanqueFijo.find(params[:id])

		if @estanque_fijo.update(estanque_fijo_params)
			redirect_to estanque_fijos_path(), notice: "Estanque '#{@estanque_fijo.nombre}' ha sido Actualizado."
  
		else
			render 'edit'
		end
	end
	
	def destroy
		@estanque_fijo = EstanqueFijo.find(params[:id])

		if @estanque_fijo.destroy
		 redirect_to estanque_fijos_path(), notice: " '#{@estanque_fijo.nombre}' ha sido elminado."
		else
		  redirect_to estanque_fijos_path(), notice: "Error al eliminar '#{@estanque_fijo.nombre}'."
		end
    end
	
	private
  	def estanque_fijo_params
  		params.require(:estanque_fijo).permit(:nombre, :capacidad, :codigo, :litros_actual, :ubicacion)
  	end
end
