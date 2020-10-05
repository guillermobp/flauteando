class Admin::SlidesController < AdminController
  before_action :find_encuentro, except: [:edit, :update, :destroy]
  before_action :find_slide, except: %i[index new create for_select]

  def index; end

  def show; end

  def edit
    @return_to_path = request.referer || admin_encuentro_slides_path(@slide.encuentro)
  end

  def new
    @slide = Slide.new
  end

  def create
    @slide = Slide.new(slide_params)
    @slide.etiquetas = etiquetas_params.map { |e| Etiqueta.find(e[:id]) }

    # Sets fecha_slide while old schema exists!
    @slide.fecha_slide = FechaSlide.first

    if @slide.save
      flash.notice = 'La slide ha sido creado exitosamente'
      redirect_to admin_encuentro_slides_path(@encuentro)
    else
      flash.alert = 'Ocurrió un error intentando crear la slide'
      redirect_to new_admin_encuentro_slide_path(@encuentro)
    end
  end

  def update
    if @slide.update(slide_params)
      flash.notice = 'La slide ha sido actualizado correctamente'
      redirect_to admin_slides_path
    else
      flash.alert = 'Ocurrió un error intentando actualizar la slide'
      redirect_to edit_admin_slide_path(@slide)
    end
  end

  def for_select
    respond_to do |format|
      format.json { render json: Slide.for_select }
    end
  end

  def destroy
    @encuentro = @slide.encuentro
    if @slide.destroy
      flash.notice = 'La slide ha sido eliminado permanentemente'
    else
      flash.alert = 'Ocurrió un error intentando eliminar la slide'
    end
    redirect_to admin_encuentros_edit_path(@encuentro)
  end

  private

  def slide_params
    params.require(:slide).permit(:inicio, :termino, :titulo, :descripcion, :lugar)
  end

  def etiquetas_params
    params.require(:slide).permit(etiquetas: [:id])[:etiquetas]
  end

  def participantes_params
    params.require(:slide).permit(participantes: [:id])
  end

  def find_encuentro
    @encuentro = Encuentro.find(params[:encuentro_id])
  end

  def find_slide
    @slide = Slide.find(params[:id])
  end

end
