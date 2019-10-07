class Admin::PresentacionesController < AdminController

  def index
    @encuentro = Encuentro.find(params[:encuentro_id])
  end

  def create
    e = Encuentro.find(params[:encuentro_id])
    p = Presentacion.new(artista_id: params[:artista_id], encuentro_id: params[:encuentro_id])
    if p.save
      flash[:notice] = 'El artista ha sido asociado exitosamente'
    else
      flash[:alert] = 'Ha ocurrido un error intentando asociar el artista'
    end

    redirect_to admin_encuentro_presentaciones_path(e)
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

end
