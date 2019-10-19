class Admin::PresentacionesController < AdminController
  before_action :find_concierto, only: %i[index new create]

  def index
    @encuentro = @concierto.encuentro
  end

  def new
    @encuentro = @concierto.encuentro
    @presentacion = @concierto.presentaciones.new
  end

  def create

    p = Presentacion.create(concierto: @concierto, orden: presentacion_params[:orden])

    presentacion_params[:obras_ids].each do |id|
      ObraPresentacion.create(presentacion: p, obra_id: id)
    end

    presentacion_params[:artistas_ids].each do |id|
      ArtistaPresentacion.create(presentacion: p, artista_id: id)
    end

    flash[:notice] = 'La presentación ha sido creada exitosamente'

    redirect_to admin_concierto_presentaciones_path(@concierto)
  end

  def edit
    @presentacion = Presentacion.find(params[:id])
    @encuentro = @presentacion.encuentro
  end

  def destroy
    p = Presentacion.find(params[:id])
    if p.destroy
      flash[:notice] = 'La presentación ha sido asociado exitosamente'
    else
      flash[:alert] = 'Ha ocurrido un error intentando eliminar la presentación'
    end

    redirect_to admin_encuentro_presentaciones_path(p.encuentro)
  end

  private

  def find_concierto
    @concierto = Concierto.find(params[:concierto_id])
  end

  def presentacion_params
    params.require(:presentacion).permit(:lugar, :orden, obras_ids: [], artistas_ids: [])
  end

end
