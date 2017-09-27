class ClientesController < ApplicationController

	before_action :clear_search_index, :only => [:index]
	respond_to :html, :json
  def new
	@cliente = Cliente.new
	respond_modal_with @cliente
  end

  def index
	@search = Cliente.ransack(params[:q])
	@cliente = @search.result.paginate(page: params[:page], per_page:2)
  end

  def edit
	@cliente = Cliente.find(params[:id])
  end

  def show
	@cliente = Cliente.find(params[:id])
	
	@search = Arriendo.joins('INNER JOIN clientes ON cliente_id = clientes.id AND clientes.id =', params[:id]).ransack(params[:q])
	@arriendos = @search.result.paginate(page: params[:page], per_page:2)
	
  end
  
  def create
  	@cliente = Cliente.new(cliente_params)
  	if @cliente.save
  		redirect_to clientes_path(), notice: "Cliente '#{@cliente.nombre}' agregado correctamente."
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
  
  def update
		@cliente = Cliente.find(params[:id])

		if @cliente.update(cliente_params)
			redirect_to clientes_path(), notice: "Cliente #{@cliente.nombre} ha sido Actualizada."
		else
			render 'edit'
		end
	end
  
    private
  	def cliente_params
  		params.require(:cliente).permit(:rut_cliente, :dv, :nombre, :direccion, :nombre_contacto, :telefono, :mail, :giro)
  	end

	
end
