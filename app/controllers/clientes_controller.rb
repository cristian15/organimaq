class ClientesController < ApplicationController
  def new
	@cliente = Cliente.new
  end

  def index
	@cliente = Cliente.all
  end

  def edit
	@cliente = Cliente.find(params[:id])
  end

  def show
	@cliente = Cliente.find(params[:id])
  end
  
  def create
  	@cliente = Cliente.new(cliente_params)
  	if @cliente.save
  		redirect_to @cliente
  	else
  		render 'new'
  	end
  end
  
   def destroy
    @cliente = Cliente.find(params[:id])

    if @cliente.destroy
     redirect_to clientes_path(), notice: " '#{@cliente.nombre}' ha sido elminado."
    else
      redirect_to clientes_path(), notice: "Error al eliminar '#{@cliente.nombre}'."
    end
  end
  
    private
  	def cliente_params
  		params.require(:cliente).permit(:rut_cliente, :dv, :nombre, :direccion, :nombre_contacto, :telefono, :mail, :giro)

  	end
	
end
