class Admin::EncuentrosController < AdminController
  before_action :find_encuentro, only: [:edit, :update, :destroy, :configuracion]

  def index; end

  def new
    @encuentro = Encuentro.new
  end

  def create
    @encuentro = Encuentro.new(encuentro_params)

    if @encuentro.save
      flash[:notice] = 'El encuentro ha sido creado exitosamente'
    else
      flash[:alert] = 'Ha ocurrido un error intentando crear el encuentro'
    end

    redirect_to admin_encuentros_path
  end

  def edit; end

  def update
    if @encuentro.update(encuentro_params)
      flash[:notice] = 'El encuentro ha sido actualizado exitosamente'
    else
      flash[:alert] = 'Ocurrió un error intentando actualizar el encuentro'
    end

    redirect_to edit_admin_encuentro_path(@encuentro)
  end

  def destroy
    e = Encuentro.find(params[:id])
    if e.destroy
      flash.notice = 'El encuentro ha sido eliminado exitosamente'
      redirect_to admin_encuentros_path
    else
      flash.alert = 'Ocurrió un error intentando eliminar el encuentro'
      redirect_to admin_encuentro_config_index_path(@encuentro)
    end
  end

  private

    def encuentro_params
      params.require(:encuentro).permit(:version,
                                        :titulo,
                                        :epigrafe,
                                        :bajada,
                                        :afiche,
                                        :mision,
                                        :vision,
                                        :habilitado,
                                        fotos: [])
    end

    def find_encuentro
      @encuentro = Encuentro.find(params[:id])
    end

end
