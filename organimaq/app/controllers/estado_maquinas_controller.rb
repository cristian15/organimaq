class EstadoMaquinasController < ApplicationController
	respond_to :html, :json
  def index
  	@estado_maquina = EstadoMaquina.all
  end


  def edit
  	@estado_maquina = EstadoMaquina.find(params[:id])
  end

  def new
  	@estado_maquina = EstadoMaquina.new
	respond_modal_with @estado_maquina
  end

  def destroy

  	@estado_maquina = EstadoMaquina.find(params[:id])
  	if @estado_maquina.destroy
  		redirect_to estado_maquinas_path(), notice: "Estado Maquinaria '#{@estado_maquina.nombre}' ha sido elminado."
  	else
  		redirect_to estado_maquinas_path(), notice: "No se Pudo Eliminar '#{@estado_maquina.nombre}'."
  	end
  end


  def update
		@estado_maquina = EstadoMaquina.find(params[:id])

		if @estado_maquina.update(estado_maquina_params)
			redirect_to estado_maquinas_path(), notice: "Estado Maquinaria '#{@estado_maquina.nombre}' ha sido Actualizado."
  
		else
			render 'edit'
		end
	end

  def create
		@estado_maquina = EstadoMaquina.new(estado_maquina_params)
		if @estado_maquina.save
			redirect_to estado_maquinas_path(), notice: "Estado Maquinaria '#{@estado_maquina.nombre}' ha sido Agregado."

		else
			render 'new'
		end
	end

  private
		def estado_maquina_params
			params.require(:estado_maquina).permit(:nombre)
		end
end
