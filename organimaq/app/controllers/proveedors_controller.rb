class ProveedorsController < ApplicationController
	respond_to :html, :json
  def index
	@search = Proveedor.ransack(params[:q])
	@proveedor = @search.result.paginate(page: params[:page], per_page:2)
  end

  def show
	@proveedor = Proveedor.find(params[:id])
  end

  def edit
	@proveedor = Proveedor.find(params[:id])
	respond_modal_with @proveedor
  end

  def new
	@proveedor = Proveedor.new
	respond_modal_with @proveedor
  end
  
  def create
  	@proveedor = Proveedor.new(proveedor_params)
  	if @proveedor.save
  		redirect_to proveedors_path, notice: " '#{@proveedor.nombre}' ha sido Creado."
  	else
  		render 'new'
  	end
  end
  
  def destroy
    @proveedor = Proveedor.find(params[:id])

    if @proveedor.destroy
     redirect_to proveedors_path(), notice: " '#{@proveedor.nombre}' ha sido elminado."
    else
      redirect_to proveedors_path(), notice: "Error al eliminar '#{@proveedor.nombre}'."
    end
  end
  
  def update
		@proveedor = Proveedor.find(params[:id])

		if @proveedor.update(proveedor_params)
			redirect_to proveedors_path(), notice: "Proveedor #{@proveedor.nombre} ha sido Actualizado."
		else
			render 'edit'
		end
	end
  
  
  
  private
	def proveedor_params
	params.require(:proveedor).permit(:rut, :dv, :nombre, :direccion, :giro, :telefono, :email)
  end
end
