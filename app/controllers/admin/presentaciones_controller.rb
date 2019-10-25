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
    p = @concierto.presentaciones.new
    p.orden = presentacion_params[:orden]
    p.obras = Array(presentacion_params[:obras]).map { |x| Obra.find(x[:id]) }
    p.artistas = Array(presentacion_params[:artistas]).map { |x| Artista.find(x[:id]) }

    if p.save
      flash.notice = 'La presentación ha sido creada exitosamente'
    else
      flash.alert = 'Ocurrió un error intentando crear la presentación'
    end

    redirect_to admin_concierto_presentaciones_path(@concierto)
  end

  def edit
    @presentacion = Presentacion.find(params[:id])
    @encuentro = @presentacion.encuentro
  end

  def update
    p = Presentacion.find(params[:id])
    p.orden = presentacion_params[:orden]
    p.obras = Array(presentacion_params[:obras]).map { |x| Obra.find(x[:id]) }
    p.artistas = Array(presentacion_params[:artistas]).map { |x| Artista.find(x[:id]) }

    if p.save
      flash.notice = 'La presentación fue actualizada exitosamente'
      redirect_to admin_concierto_presentaciones_path(p.concierto)
    else
      flash.alert = 'Ocurrió un error intentando actualizar la presentación'
      redirect_to edit_admin_presentacion_path(p)
    end
  end

  def destroy
    p = Presentacion.find(params[:id])
    if p.destroy
      flash.notice = 'La presentación fue eliminada exitosamente'
    else
      flash.alert = 'Ocurrió un error intentando eliminar la presentación'
    end
    redirect_to admin_concierto_presentaciones_path(p.concierto)
  end

  def obras_for_select
    respond_to do |format|
      format.json { render json: Presentacion.find(params[:id]).obras_for_select }
    end
  end

  def artistas_for_select
    respond_to do |format|
      format.json { render json: Presentacion.find(params[:id]).artistas_for_select }
    end
  end

  private

  def find_concierto
    @concierto = Concierto.find(params[:concierto_id])
  end

  def presentacion_params
    params.require(:presentacion).permit(:orden, obras: [:id], artistas: [:id])
  end

end
