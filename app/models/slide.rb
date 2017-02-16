class Slide < ApplicationRecord
  has_many :images, as: :target
end
