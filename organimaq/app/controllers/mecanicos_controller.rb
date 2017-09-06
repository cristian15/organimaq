class MecanicosController < ApplicationController

	before_action :clear_search_index, :only => [:index]

  def index
	@search = Mecanico.ransack(params[:q])
	@mecanico = @search.result.paginate(page: params[:page], per_page:2)
  end

  def show
  	@mecanico = Mecanico.find(params[:id])
  end

  def new
  	@mecanico = Mecanico.new
  end

  def edit
    @mecanico = Mecanico.find(params[:id])
  end

  def create
  	@mecanico = Mecanico.new(mecanico_params)
  	if @mecanico.save
  		redirect_to @mecanico
  	else
  		render 'new'
  	end
  end

  def destroy
    @mecanico = Mecanico.find(params[:id])

    if @mecanico.destroy
	  redirect_to mecanicos_path(), notice: " '#{@mecanico.nombre}' ha sido elminado."
    else
      redirect_to mecanicos_path(), notice: "Error al eliminar '#{@mecanico.nombre}'."
    end
  end

  def update
    @mecanico = Mecanico.find(params[:id])

    if @mecanico.update(mecanico_params)
      redirect_to mecanicos_path(), notice: "#{@mecanico.nombre} ha sido Actualizado."
    else
      render 'edit'
    end
  end



  private
  	def mecanico_params
  		params.require(:mecanico).permit(:rut, :nombre, :dv, :tipo_mecanico_id, :apellido_paterno, :foto, :apellido_materno,:jornada, :valor_hora)

  	end
	
end
