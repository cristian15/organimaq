class DashboardsController < ApplicationController
  def index
	@maquinas = Maquina.all
  end
end
