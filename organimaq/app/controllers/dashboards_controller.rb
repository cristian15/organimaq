class DashboardsController < ApplicationController
  def index
	@maquinas = Maquina.all
	@estados = EstadoMaquina.all
	
	@emaq = @estados.map do |u|		# Crea el arreglo para los datos de json 
		{:label => u.nombre, :value => Maquina.where("estado_maquina_id="+u.id.to_s).count}
	end
	
	
	@planificaciones = Planificacion.all
	
	
	@eplan = [{:label => "Cerrada", :value => Planificacion.where("estado='Cerrada'").count }, {:label => "Abierta", :value => Planificacion.where("estado='Abierta'").count }]
	
  end
end
