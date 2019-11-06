class Admin::ArtistasController < AdminController
  before_action :find_artista, except: %i[index new create for_select]

  def index
    @artistas = Artista.all
  end

  def show; end

  def edit
    @return_to_path = request.referer || admin_artistas_path
  end

  def new
    @artista = Artista.new
  end

  def create
    @artista = Artista.new(artista_params)
    if @artista.save
      flash.notice = 'El artista ha sido creado exitosamente'
      redirect_to admin_artistas_path
    else
      flash.alert = 'Ocurrió un error intentando crear el artista'
      redirect_to new_admin_artista_path(@artista)
    end
  end

  def update
    if @artista.update(artista_params)
      flash.notice = 'El artista ha sido actualizado correctamente'
      redirect_to admin_artistas_path
    else
      flash.alert = 'Ocurrió un error intentando actualizar el artista'
      redirect_to edit_admin_artista_path(@artista)
    end
  end

  def for_select
    respond_to do |format|
      format.json { render json: Artista.for_select }
    end
  end

  def destroy
    if @artista.encuentros.count > 0
      flash[:warning] = 'El artista participa en uno o más encuentro; debe eliminar cada participación para continuar.'
    elsif @artista.destroy
      flash.notice = 'El artista ha sido eliminado permanentemente'
    else
      flash.alert = 'Ocurrió un error intentando eliminar el artista'
    end
    redirect_to admin_artistas_path
  end

  private

  def artista_params
    params.require(:artista).permit(:nombre, :bio, :foto)
  end

  def find_artista
    @artista = Artista.find(params[:id])
  end

end
