class TipoMaquinasController < ApplicationController
	respond_to :html, :json
  def new
  	@tipo_maquina = TipoMaquina.new
	respond_modal_with @tipo_maquina
  end

  def destroy
  	@tipo_maquina = TipoMaquina.find(params[:id])

  	if @tipo_maquina.destroy
  	 redirect_to tipo_maquinas_path(), notice: "Tipo Maquinaria '#{@tipo_maquina.nombre}' ha sido elminada."
    else
      redirect_to tipo_maquinas_path(), notice: "Error al eliminar '#{@tipo_maquina.nombre}'."
    end
  end

  def edit
  	@tipo_maquina = TipoMaquina.find(params[:id])
	respond_modal_with @tipo_maquina
  end

  def index
  	@tipo_maquina = TipoMaquina.all
  end

  def show
  	@tipo_maquina = TipoMaquina.find(params[:id])
  end

  def create
		@tipo_maquina = TipoMaquina.new(tipo_maquina_params)
		if @tipo_maquina.save
			redirect_to tipo_maquinas_path(), notice: "Tipo Maquinaria '#{@tipo_maquina.nombre}' ha sido Agregado."

		else
			render 'new'
		end
	end

	def update
		@tipo_maquina = TipoMaquina.find(params[:id])

		if @tipo_maquina.update(tipo_maquina_params)
			redirect_to tipo_maquinas_path(), notice: "Tipo Maquinaria '#{@tipo_maquina.nombre}' ha sido Actualizado."
  
		else
			render 'edit'
		end
	end

  private
		def tipo_maquina_params
			params.require(:tipo_maquina).permit(:nombre)
		end
end
