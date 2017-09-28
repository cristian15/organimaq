class OperadorsController < ApplicationController

  def index
	@search = Operador.ransack(params[:q])
	@operador = @search.result.paginate(page: params[:page], per_page:4)
	
  end

  def new
	@operador = Operador.new
  end

  def show
	@operador = Operador.find(params[:id])
	@infraction = Infraction.joins('INNER JOIN operadors ON operador_id = operadors.id AND operadors.id =', params[:id])
	
	# Busqueda y paginacion
	@search = Report.joins('INNER JOIN operadors ON operador_id = operadors.id AND operadors.id =', params[:id]).ransack(params[:q])
	@reports = @search.result.paginate(page: params[:page], per_page:4)
	
  end

  def edit
	@operador = Operador.find(params[:id])
	@infraction = Infraction.joins('INNER JOIN operadors ON operador_id = operadors.id AND operadors.id =', params[:id])
  end
  
	def create
		
		@operador = Operador.new(operador_params);

		if @operador.save
			redirect_to @operador
		else
			render 'new'
		end
	end
	
	def destroy
	end
	
	def update
		@operador = Operador.find(params[:id])
		if @operador.update(operador_params)
		redirect_to operadors_path(), notice: "Operador #{@operador.nombre} ha sido editado."
		else
		render 'edit'
		end
	end
	
	private
	def operador_params
		params.require(:operador).permit(:rut,:dv,:nombre,:apellido_p,:apellido_m,:direccion,:telefono,:foto,:calzado,:overol,:chaleco)
	end	
	
	def sort_column
		Operador.column_names.include?(params[:sort]) ? params[:sort] : "nombre"
	end
	
	def sort_direction
		%w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
	end
	
end
