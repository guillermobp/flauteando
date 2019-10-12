class Admin::ConfigController < AdminController

  def index
    @encuentro = Encuentro.find(params[:encuentro_id])
  end

end
