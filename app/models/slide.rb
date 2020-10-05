class Slide < ApplicationRecord
  belongs_to :encuentro

  has_one_attached :image
end
