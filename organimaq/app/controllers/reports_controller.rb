class ReportsController < ApplicationController
  def new
	@report = Report.new
	@arriendo = Arriendo.find(params[:id])
	@maquina = Maquina.find(@arriendo.maquina_id)
  end

  def index
	@report = Report.all
  end

  def show
	@report = Report.find(params[:id])
  end

  def edit
	@report = Report.find(params[:id])
  end
  
  def create
  	@report = Report.new(report_params)
  	if @report.save
  		redirect_to arriendo_path(@report.arriendo_id)
  	else
  		render 'new'
  	end
  end
  
  def update
	@report = Report.find(params[:id])
	if @report.update(report_params)
		redirect_to arriendo_path(@report.arriendo_id), notice: "Reporte #{@report.nombre} ha sido Actualizada."
	else
		render 'edit'
	end
  end
  
  def destroy
    @report = Report.find(params[:id])

    if @report.destroy
     redirect_to arriendo_path(@report.arriendo_id), notice: " '#{@report.nombre}' ha sido elminado."
    else
      redirect_to arriendo_path(@report.arriendo_id), notice: "Error al eliminar '#{@report.nombre}'."
    end
  end
  
   private
  	def report_params
  		params.require(:report).permit(:nombre, :fecha, :horas, :numero, :arriendo_id, :detalle, :horometro_inicial, :horometro_final, :operador_id)
  	end
	
  
end