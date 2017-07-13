class RepuestosController < ApplicationController
  def index
  	@repuesto = Repuesto.all
  end

  def show
  	@repuesto = Repuesto.find(params[:id])
  end

  def new
  	@repuesto = Repuesto.new
  end

  def edit
    @repuesto = Repuesto.find(params[:id])
  end

  def create
  	@repuesto = Repuesto.new(repuesto_params)
  	if @repuesto.save
  		redirect_to @repuesto
  	else
  		render 'new'
  	end
  end

  def destroy
    @repuesto = Repuesto.find(params[:id])

    if @repuesto.destroy
     redirect_to repuestos_path(), notice: "Repuesto '#{@repuesto.nombre}' ha sido elminado."
    else
      redirect_to repuestos_path(), notice: "Error al eliminar '#{@repuesto.nombre}'."
    end
  end

  def update
    @repuesto = Repuesto.find(params[:id])

    if @repuesto.update(repuesto_params)
      redirect_to repuestos_path(), notice: "Repuesto #{@repuesto.nombre} ha sido Actualizado."
    else
      render 'edit'
    end
  end

  private
  	def repuesto_params
  		params.require(:repuesto).permit(:codigo, :nombre, :descripcion, :tipo_repuesto_id, :stock, :foto)
  	end
end
