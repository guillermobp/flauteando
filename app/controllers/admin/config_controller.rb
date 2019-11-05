class Admin::ConfigController < AdminController
  before_action :find_encuentro

  def index
    @artista_visible = ArtistaVisible.new(encuentro: @encuentro)
  end

  def toggle_visibilidad_artista
    artista = Artista.find(params[:artista_id])
    artista_visible = ArtistaVisible.find_or_initialize_by(artista: artista, encuentro: @encuentro)
    artista_visible.new_record? ? artista_visible.save : artista_visible.delete
  end

  private

  def find_encuentro
    @encuentro = Encuentro.find(params[:encuentro_id])
  end

end
