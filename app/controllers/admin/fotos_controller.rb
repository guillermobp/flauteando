class Admin::FotosController < AdminController

  def index
    @encuentro = Encuentro.find(params[:encuentro_id])
  end

end
