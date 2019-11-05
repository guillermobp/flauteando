class ArtistaVisible < ApplicationRecord
  default_scope { order(:orden) }
  belongs_to :artista
  belongs_to :encuentro

  def previous
    encuentro.artistas_visibles.find_by(orden: self.orden - 1)
  end

  def next
    encuentro.artistas_visibles.find_by(orden: self.orden + 1)
  end
end
