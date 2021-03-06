class MaquinasController < ApplicationController

	
	def index
		@search = Maquina.ransack(params[:q])
		@maquina = @search.result.paginate(page: params[:page], per_page:4)
		
		@maquinas = Maquina.ransack(params[:q]).result
		respond_to do |format|
		  format.html 
		  format.js 
		  format.xlsx 
		  
		end
	
	end
	def show
		@maquina = Maquina.find(params[:id])
		
		@search_cargas =CargaCombustible.joins("INNER JOIN maquinas ON maquina_id=maquinas.id and maquinas.id=", params[:id]).ransack(params[:q_carga])
		@carga = @search_cargas.result.paginate(page: params[:page_cargas], per_page:4)
		
		@search = Factura.joins('INNER JOIN maquinas ON maquina_id = maquinas.id AND maquinas.id =', params[:id]).ransack(params[:q])
		@factura = @search.result.paginate(page: params[:page], per_page:4)
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
		
	
end
