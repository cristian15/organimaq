class DashboardsController < ApplicationController
  def index
	@maquinas = Maquina.all
	@estados = EstadoMaquina.all
	@emaq = @estados.map do |u|		# Crea el arreglo para los datos de json 
		{:label => u.nombre, :value => Maquina.where("estado_maquina_id="+u.id.to_s).count}
	end
	
	
  end
end
