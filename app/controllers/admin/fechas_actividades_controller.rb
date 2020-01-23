class Admin::FechasActividadesController < AdminController
  before_action :find_encuentro, except: [:update, :destroy]

  def index
    @fecha_actividad = FechaActividad.new(encuentro: @encuentro)
  end

  def create
    @fecha_actividad = @encuentro.fechas_actividades.new(fecha_actividad_params)
    if @fecha_actividad.save
      flash.notice = 'La fecha ha sido creada exitosamente'
    else
      flash.alert = 'Ocurrió un error intentando crear la fecha'
    end
    redirect_to admin_encuentro_fechas_actividades_path(@encuentro)
  end

  def update
    fecha_actividad = FechaActividad.find(params[:id])
    if fecha_actividad.update(fecha_actividad_params)
      flash.notice = 'La fecha ha sido actualizada exitosamente'
      redirect_to admin_encuentro_fechas_actividades_path(fecha_actividad.encuentro)
    else
      flash.alert = 'Ocurrió un error intentando actualizar la fecha'
      redirect_to admin_fecha_actividad_actividades_path(fecha_actividad)
    end
  end

  def destroy
    fecha = FechaActividad.find(params[:id])
    if fecha.destroy
      flash.notice = 'La fecha ha sido eliminada exitosamente'
    else
      flash.alert = 'Ocurrió un error intentando eliminar la fecha'
    end
    redirect_to admin_encuentro_fechas_actividades_path(fecha.encuentro)
  end

  private

  def find_encuentro
    @encuentro = Encuentro.find(params[:encuentro_id])
  end

  def fecha_actividad_params
    params.require(:fecha_actividad).permit(:fecha, :lugar, :tematica)
  end

end
