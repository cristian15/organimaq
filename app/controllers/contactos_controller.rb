class ContactosController < ApplicationController
  
  def new
  	@contacto = Contacto.new
  end

  def create
  	@contacto = Contacto.new(params[:contacto])
  	@contacto.request = request
  	if @contacto.deliver
  		flash.now[:notice] = 'Gracias por contactarnos.'
      #redirect_to contactos_new_path(), notice: "Gracias por contactarnos."
  
  	   
    else
  		flash.now[:error] = 'No se pudo enviar el mensaje.'
  		render :new
  	end
  end
end
