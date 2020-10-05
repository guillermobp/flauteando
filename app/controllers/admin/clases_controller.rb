class Admin::ClasesController < AdminController
  before_action :find_clase, except: %i[index new create for_select]
  before_action :find_encuentro, except: [:update, :destroy]

  def index
    @clases = Clase.all
  end

  def show; end

  def edit
    @return_to_path = request.referer || admin_clases_path
  end

  def new
    @clase = Clase.new
  end

  def create
    @clase = Clase.new(clase_params)
    if @clase.save
      flash.notice = 'La clase ha sido creado exitosamente'
      redirect_to admin_clases_path
    else
      flash.alert = 'Ocurrió un error intentando crear la clase'
      redirect_to new_admin_clase_path(@clase)
    end
  end

  def update
    if @clase.update(clase_params)
      flash.notice = 'La clase ha sido actualizado correctamente'
      redirect_to admin_clases_path
    else
      flash.alert = 'Ocurrió un error intentando actualizar la clase'
      redirect_to edit_admin_clase_path(@clase)
    end
  end

  def for_select
    respond_to do |format|
      format.json { render json: Clase.for_select }
    end
  end

  def destroy
    if @clase.actividades.count > 0
      flash[:warning] = 'La clase se usa en una o más actividades; debe eliminar cada uso para continuar.'
    elsif @clase.destroy
      flash.notice = 'La clase ha sido eliminado permanentemente'
    else
      flash.alert = 'Ocurrió un error intentando eliminar la clase'
    end
    redirect_to admin_clases_path
  end

  private

  def clase_params
    params.require(:clase).permit(:nombre, :descripcion)
  end

  def find_encuentro
    @encuentro = Encuentro.find(params[:encuentro_id])
  end

  def find_clase
    @clase = Clase.find(params[:id])
  end

end
