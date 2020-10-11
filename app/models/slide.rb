class Slide < ApplicationRecord
  default_scope { order(:order) }
  belongs_to :encuentro
  has_one_attached :image

  def previous
    encuentro.slides.find_by(order: self.order - 1)
  end

  def next
    encuentro.slides.find_by(order: self.order + 1)
  end
end
