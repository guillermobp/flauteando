class Admin::ConciertosController < AdminController
  before_action :find_encuentro

  def index
    @concierto = Concierto.new(encuentro: @encuentro)
  end

  def create
    @concierto = @encuentro.conciertos.new(concierto_params)
    if @concierto.save
      flash.notice = 'El concierto ha sido creado exitosamente'
    else
      flash.alert = 'Ocurrió un error intentando crear el concierto'
    end
    redirect_to admin_encuentro_conciertos_path(@encuentro)
  end

  private

  def find_encuentro
    @encuentro = Encuentro.find(params[:encuentro_id])
  end

  def concierto_params
    params.require(:concierto).permit(:fecha, :hora, :lugar)
  end

end
