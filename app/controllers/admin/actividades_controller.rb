class Admin::ActividadesController < AdminController
  before_action :find_encuentro, except: %i[edit update destroy tags_for_select participantes_for_select]
  before_action :find_actividad, except: %i[index new create for_select]

  def index; end

  def show; end

  def edit
    @return_to_path = request.referer || admin_encuentro_actividades_path(@actividad.encuentro)
  end

  def new
    @actividad = @encuentro.actividades.new
  end

  def create
    @actividad = @encuentro.actividades.new(actividad_params)
    @actividad.etiquetas = etiquetas_params.map { |e| Etiqueta.find(e[:id]) } unless etiquetas_params.nil?
    @actividad.participantes = participantes_params.map { |p| Participante.find(p[:id]) } unless participantes_params.nil?
    if @actividad.save
      flash.notice = 'La actividad ha sido creado exitosamente'
      redirect_to admin_encuentro_actividades_path(@encuentro)
    else
      flash.alert = 'Ocurrió un error intentando crear la actividad'
      redirect_to new_admin_encuentro_actividad_path(@encuentro)
    end
  end

  def update
    @actividad.etiquetas = etiquetas_params.map { |e| Etiqueta.find(e[:id]) } unless etiquetas_params.nil?
    @actividad.participantes = participantes_params.map { |p| Participante.find(p[:id]) } unless participantes_params.nil?
    if @actividad.save and @actividad.update(actividad_params)
      flash.notice = 'La actividad ha sido actualizado correctamente'
      redirect_to admin_encuentro_actividades_path(@actividad.encuentro)
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
    if @actividad.destroy
      flash.notice = 'La actividad ha sido eliminado permanentemente'
    else
      flash.alert = 'Ocurrió un error intentando eliminar la actividad'
    end
    redirect_to admin_encuentro_actividades_path(@actividad.encuentro)
  end

  def tags_for_select
    respond_to do |format|
      format.json { render json: @actividad.tags_for_select }
    end
  end

  def participantes_for_select
    respond_to do |format|
      format.json { render json: @actividad.participantes_for_select }
    end
  end

  private

  def actividad_params
    params
    .require(:actividad)
    .permit(
      :fecha,
      :inicio,
      :termino,
      :titulo,
      :titulo_en_calendario,
      :descripcion,
      :show_description_in_calendar,
      :lugar,
      :participantes_en_calendario,
      :texto_calendario,
      :texto_en_calendario,
      :details)
  end

  def etiquetas_params
    params.require(:actividad).permit(etiquetas: [:id])[:etiquetas]
  end

  def participantes_params
    params.require(:actividad).permit(participantes: [:id])[:participantes]
  end

  def find_encuentro
    @encuentro = Encuentro.find(params[:encuentro_id])
  end

  def find_actividad
    @actividad = params[:id].nil? ? Actividad.new : Actividad.find(params[:id])
  end

end
