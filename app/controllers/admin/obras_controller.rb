# frozen_string_literal: true

class Admin::ObrasController < AdminController
  before_action :find_obra, only: %i[edit update]

  def index
    @obras = Obra.all
  end

  def new
    @obra = Obra.new
  end

  def create
    obra = Obra.new(obra_params)
    if obra.save
      flash.notice = 'La obra ha sido creada exitosamente'
      redirect_to admin_obras_path
    else
      flash.alert = 'Ocurrió un error intentando crear la obra'
      redirect_to new_admin_obra_path(obra)
    end
  end

  def edit; end

  def update
    if @obra.update(obra_params)
      flash.notice = 'La obra ha sido actualizada exitosamente'
      redirect_to admin_obras_path
    else
      flash.alert = 'Ocurrió un error intentando actualizar la obra'
      redirect_to edit_admin_obra_path(@obra)
    end
  end

  def for_select
    respond_to do |format|
      format.json { render json: Obra.for_select }
    end
  end

  private

  def find_obra
    @obra = Obra.find(params[:id])
  end

  def obra_params
    params.require(:obra).permit(:titulo, :compositor)
  end

end
