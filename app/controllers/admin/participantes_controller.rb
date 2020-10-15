class Admin::ParticipantesController < AdminController
  before_action :find_participante, except: %i[index new create]

  def index
    @participantes = Participante.all
  end

  def show; end

  def edit
    @return_to_path = request.referer || admin_participantes_path
  end

  def new
    @participante = Participante.new
  end

  def create
    @participante = Participante.new(participante_params)
    if @participante.save
      flash.notice = 'La participante ha sido creado exitosamente'
      redirect_to admin_participantes_path
    else
      flash.alert = 'Ocurrió un error intentando crear la participante'
      redirect_to new_admin_participante_path(@participante)
    end
  end

  def update
    if @participante.update(participante_params)
      flash.notice = 'La participante ha sido actualizado correctamente'
      redirect_to admin_participantes_path
    else
      flash.alert = 'Ocurrió un error intentando actualizar la participante'
      redirect_to edit_admin_participante_path(@participante)
    end
  end

  # def for_select
  #   respond_to do |format|
  #     format.json { render json: Participante.for_select }
  #   end
  # end

  def destroy
    if @participante.actividades.count > 0
      flash[:warning] = 'La participante se usa en una o más actividades; debe eliminar cada uso para continuar.'
    elsif @participante.destroy
      flash.notice = 'La participante ha sido eliminado permanentemente'
    else
      flash.alert = 'Ocurrió un error intentando eliminar la participante'
    end
    redirect_to admin_participantes_path
  end

  private

  def participante_params
    params.require(:participante)
      .permit(:nombre, :descripcion, :foto, :bio,
              :instagram, :twitter, :facebook, :youtube, :email)
  end

  def find_participante
    @participante = Participante.find(params[:id])
  end

end
