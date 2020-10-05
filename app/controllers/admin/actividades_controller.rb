class Admin::ActividadesController < AdminController
  before_action :find_encuentro, except: [:update, :destroy]
  before_action :find_actividad, except: %i[index new create for_select]

  def index; end

  def show; end

  def edit
    @return_to_path = request.referer || admin_actividades_path
  end

  def new
    @actividad = Actividad.new
  end

  def create
    @actividad = Actividad.new(actividad_params)
    @actividad.etiquetas = etiquetas_params.map { |e| Etiqueta.find(e[:id]) }

    # Sets fecha_actividad while old schema exists!
    @actividad.fecha_actividad = FechaActividad.first

    if @actividad.save
      flash.notice = 'La actividad ha sido creado exitosamente'
      redirect_to admin_encuentro_actividades_path(@encuentro)
    else
      flash.alert = 'Ocurrió un error intentando crear la actividad'
      redirect_to new_admin_encuentro_actividad_path(@encuentro)
    end
  end

  def update
    if @actividad.update(actividad_params)
      flash.notice = 'La actividad ha sido actualizado correctamente'
      redirect_to admin_actividades_path
    else
      flash.alert = 'Ocurrió un error intentando actualizar la actividad'
      redirect_to edit_admin_actividad_path(@actividad)
    end
  end

  def for_select
    respond_to do |format|
      format.json { render json: Actividad.for_select }
    end
  end

  def destroy
    if @actividad.actividades.count > 0
      flash[:warning] = 'La actividad se usa en una o más actividades; debe eliminar cada uso para continuar.'
    elsif @actividad.destroy
      flash.notice = 'La actividad ha sido eliminado permanentemente'
    else
      flash.alert = 'Ocurrió un error intentando eliminar la actividad'
    end
    redirect_to admin_actividades_path
  end

  private

  def actividad_params
    params.require(:actividad).permit(:inicio, :termino, :titulo, :descripcion, :lugar)
  end

  def etiquetas_params
    params.require(:actividad).permit(etiquetas: [:id])[:etiquetas]
  end

  def participantes_params
    params.require(:actividad).permit(participantes: [:id])
  end

  def find_encuentro
    @encuentro = Encuentro.find(params[:encuentro_id])
  end

  def find_actividad
    @actividad = Actividad.find(params[:id])
  end

end
