class Admin::ActividadesController < AdminController
  before_action :find_fecha_actividad, only: %i[index new create]
  before_action :find_actividad, only: %i[update destroy]

  def index
    @encuentro = @fecha_actividad.encuentro
  end

  def new
    @encuentro = @fecha_actividad.encuentro
    @actividad = @fecha_actividad.actividades.new
  end

  def create
    a = @fecha_actividad.actividades.new(actividad_params)
    if a.save
      flash.notice = 'La actividad ha sido creada exitosamente'
    else
      flash.alert = 'Ocurrió un error intentando crear la actividad'
    end

    redirect_to admin_fecha_actividad_actividades_path(@fecha_actividad)
  end

  def edit
    @actividad = Actividad.find(params[:id])
    @encuentro = @actividad.encuentro
  end

  def update
    if @actividad.update(actividad_params)
      flash.notice = 'La actividad fue actualizada exitosamente'
      redirect_to admin_fecha_actividad_actividades_path(@actividad.fecha_actividad)
    else
      flash.alert = 'Ocurrió un error intentando actualizar la actividad'
      redirect_to edit_admin_actividad_path(@actividad)
    end
  end

  def destroy
    if @actividad.destroy
      flash.notice = 'La actividad fue eliminada exitosamente'
    else
      flash.alert = 'Ocurrió un error intentando eliminar la actividad'
    end
    redirect_to admin_fecha_actividad_actividades_path(@actividad.fecha_actividad)
  end

  private

  def find_fecha_actividad
    @fecha_actividad = FechaActividad.find(params[:fecha_actividad_id])
  end

  def find_actividad
    @actividad = Actividad.find(params[:id])
  end

  def actividad_params
    params.require(:actividad).permit(:inicio, :termino, :titulo, :descripcion, :lugar)
  end

end
