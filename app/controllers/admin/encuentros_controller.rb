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
    if (params[:encuentro][:fotos])
      @encuentro.fotos.attach(params[:encuentro][:fotos])
    end
    if params[:encuentro][:slides]
      next_slide_order = 1 + (@encuentro.slides.last&.order || 0)
      params[:encuentro][:slides].each.with_index(next_slide_order) do |image, order|
        slide = @encuentro.slides.new
        slide.image.attach(image)
        slide.order = order
        slide.save
      end
    end
    if params[:encuentro][:slide]
      params[:encuentro][:slide].each do |id, slide_dto|
        slide = Slide.find(id)
        slide.title = slide_dto[:title]
        slide.description = slide_dto[:description]
        slide.save
      end
    end
    if @encuentro.update(encuentro_params)
      flash[:notice] = 'El encuentro ha sido actualizado exitosamente'
    else
      flash[:alert] = 'Ocurrió un error intentando actualizar el encuentro'
    end
    redirect_to params[:encuentro][:return_path] || edit_admin_encuentro_path(@encuentro)
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
                                        :habilitado)
    end

    def find_encuentro
      @encuentro = Encuentro.find(params[:id])
    end

end
