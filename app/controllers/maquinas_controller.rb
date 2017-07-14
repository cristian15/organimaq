class MaquinasController < ApplicationController

	def index
		#@maquina = Maquina.all.paginate(:per_page =>2, :page =>params[:page])
		@maquina = Maquina.order(params[:sort]).paginate(:per_page =>2, :page =>params[:page])
	end
	def show
		@maquina = Maquina.find(params[:id])
	end
	def new
		@maquina = Maquina.new
	end

	def edit
		@maquina = Maquina.find(params[:id])
	end

	def create
		
		@maquina = Maquina.new(maquina_params);

		if @maquina.save
			redirect_to @maquina
		else
			render 'new'
		end
	end

	def destroy
		@maquina = Maquina.find(params[:id])
		@maquina.destroy
		redirect_to maquinas_path(), notice: "Maquina #{@maquina.nombre} ha sido elminada."
	end

	def update
		@maquina = Maquina.find(params[:id])

		if @maquina.update(maquina_params)
			redirect_to maquinas_path(), notice: "Maquina #{@maquina.nombre} ha sido Actualizada."
		else
			render 'edit'
		end
	end

	private
		def maquina_params
			params.require(:maquina).permit(:nombre,:codigo,:chasis,:motor,:patente,:marca,:valor_hora,:valor_dia,:anio,:foto,:km_actual,:neumaticos,:fecha_permiso,:fecha_seguro,:fecha_revision,:ejes,:horometro_actual,:anio_compra,:valor_compra,:modelo,:hora_minima,:rendimiento_hora,:rendimiento_km, :tipo_maquina_id, :estado_maquina_id)
		end
		
		def sort_column
			Maquina.columns_names.include?(params[:sort]) ? params[:sort] : "name"
		end
		
		def sort_direction
			%w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
		end
end
