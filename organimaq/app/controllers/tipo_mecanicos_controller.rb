class TipoMecanicosController < ApplicationController
  def new
  	@tipo_mecanico = TipoMecanico.new
  end

  def destroy
  	@tipo_mecanico = TipoMecanico.find(params[:id])

  	if @tipo_mecanico.destroy
  	 redirect_to tipo_mecanicos_path(), notice: "Tipo Mecanico '#{@tipo_mecanico.nombre}' ha sido elminada."
    else
      redirect_to tipo_mecanicos_path(), notice: "Error al eliminar '#{@tipo_mecanico.nombre}'."
    end
  end

  def edit
  	@tipo_mecanico = TipoMecanico.find(params[:id])
  end

  def index
  	@tipo_mecanico = TipoMecanico.all
  end

  def show
  	@tipo_mecanico = TipoMecanico.find(params[:id])
  end

  def create
		@tipo_mecanico = TipoMecanico.new(tipo_mecanico_params)
		if @tipo_mecanico.save
			redirect_to tipo_mecanicos_path(), notice: "Tipo Mecanico '#{@tipo_mecanico.nombre}' ha sido Agregado."

		else
			render 'new'
		end
	end

	def update
		@tipo_mecanico = TipoMecanico.find(params[:id])

		if @tipo_mecanico.update(tipo_mecanico_params)
			redirect_to tipo_mecanicos_path(), notice: "Tipo Mecanico '#{@tipo_mecanico.nombre}' ha sido Actualizado."
  
		else
			render 'edit'
		end
	end

  private
		def tipo_mecanico_params
			params.require(:tipo_mecanico).permit(:nombre)
		end
end
