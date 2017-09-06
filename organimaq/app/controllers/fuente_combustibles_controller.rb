class FuenteCombustiblesController < ApplicationController

	before_action :clear_search_index, :only => [:index]

  def index
	@search = FuenteCombustible.ransack(params[:q])
	@fuente_combustible = @search.result.paginate(page: params[:page], per_page:2)
  end

  def new
	@fuente_combustible = FuenteCombustible.new
  end

  def edit
	@fuente_combustible = FuenteCombustible.find(params[:id])
  end

  def show
	@fuente_combustible = FuenteCombustible.find(params[:id])
  end
  
    def create
		@fuente_combustible = FuenteCombustible.new(fuente_combustible_params)
		if @fuente_combustible.save
			redirect_to fuente_combustibles_path(), notice: "Fuente '#{@fuente_combustible.nombre}' ha sido Agregado."
		else
			render 'new'
		end
	end
	
	def update
		@fuente_combustible = FuenteCombustible.find(params[:id])

		if @fuente_combustible.update(fuente_combustible_params)
			redirect_to fuente_combustibles_path(), notice: "Fuente '#{@fuente_combustible.nombre}' ha sido Actualizado."
  
		else
			render 'edit'
		end
	end
	
	def destroy
		@fuente_combustible = FuenteCombustible.find(params[:id])

		if @fuente_combustible.destroy
		 redirect_to fuente_combustibles_path(), notice: " '#{@fuente_combustible.nombre}' ha sido elminado."
		else
		  redirect_to fuente_combustibles_path(), notice: "Error al eliminar '#{@fuente_combustible.nombre}'."
		end
    end
	
	
	private
  	def fuente_combustible_params
  		params.require(:fuente_combustible).permit(:litros_combustible, :nombre, :capacidad, :codigo)
  	end
end
