class Admin::EtiquetasController < AdminController
  before_action :find_etiqueta, except: %i[index new create]

  def index
    @etiquetas = Etiqueta.all
  end

  def show; end

  def edit
    @return_to_path = request.referer || admin_etiquetas_path
  end

  def new
    @etiqueta = Etiqueta.new
  end

  def create
    @etiqueta = Etiqueta.new(etiqueta_params)
    if @etiqueta.save
      flash.notice = 'La etiqueta ha sido creado exitosamente'
      redirect_to admin_etiquetas_path
    else
      flash.alert = 'Ocurrió un error intentando crear la etiqueta'
      redirect_to new_admin_etiqueta_path(@etiqueta)
    end
  end

  def update
    if @etiqueta.update(etiqueta_params)
      flash.notice = 'La etiqueta ha sido actualizado correctamente'
      redirect_to admin_etiquetas_path
    else
      flash.alert = 'Ocurrió un error intentando actualizar la etiqueta'
      redirect_to edit_admin_etiqueta_path(@etiqueta)
    end
  end

  # def for_select
  #   respond_to do |format|
  #     format.json { render json: Etiqueta.for_select }
  #   end
  # end

  def destroy
    if @etiqueta.actividades.count > 0
      flash[:warning] = 'La etiqueta se usa en una o más actividades; debe eliminar cada uso para continuar.'
    elsif @etiqueta.destroy
      flash.notice = 'La etiqueta ha sido eliminado permanentemente'
    else
      flash.alert = 'Ocurrió un error intentando eliminar la etiqueta'
    end
    redirect_to admin_etiquetas_path
  end

  private

  def etiqueta_params
    params.require(:etiqueta).permit(:nombre, :descripcion)
  end

  def find_etiqueta
    @etiqueta = Etiqueta.find(params[:id])
  end

end
