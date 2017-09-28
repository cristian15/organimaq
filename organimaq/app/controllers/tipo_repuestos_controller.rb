class TipoRepuestosController < ApplicationController
	respond_to :html, :json
  def new
  	@tipo_repuesto = TipoRepuesto.new
	respond_modal_with @tipo_repuesto
  end

  def destroy
  	@tipo_repuesto = TipoRepuesto.find(params[:id])

  	if @tipo_repuesto.destroy
  	 redirect_to tipo_repuestos_path(), notice: "Tipo Repuesto '#{@tipo_repuesto.nombre}' ha sido elminada."
    else
      redirect_to tipo_repuestos_path(), notice: "Error al eliminar '#{@tipo_repuesto.nombre}'."
    end
  end

  def edit
  	@tipo_repuesto = TipoRepuesto.find(params[:id])
  end

  def index
  	@tipo_repuesto = TipoRepuesto.all
  end

  def show
  	@tipo_repuesto = TipoRepuesto.find(params[:id])
  end

  def create
		@tipo_repuesto = TipoRepuesto.new(tipo_repuesto_params)
		if @tipo_repuesto.save
			redirect_to repuestos_new_path(), notice: "Tipo Repuesto '#{@tipo_repuesto.nombre}' ha sido Agregado."

		else
			render 'new'
		end
	end

	def update
		@tipo_repuesto = TipoRepuesto.find(params[:id])

		if @tipo_repuesto.update(tipo_repuesto_params)
			redirect_to tipo_repuestos_path(), notice: "Tipo Repuesto '#{@tipo_repuesto.nombre}' ha sido Actualizado."
  
		else
			render 'edit'
		end
	end

  private
		def tipo_repuesto_params
			params.require(:tipo_repuesto).permit(:nombre)
		end
end
