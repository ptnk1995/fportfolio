class Targettechnique < ApplicationRecord
  belongs_to :technique
  belongs_to :target, polymorphic: true
end
