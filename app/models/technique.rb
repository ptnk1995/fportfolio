class Technique < ApplicationRecord
  has_many :target_techniques, dependent: :destroy, as: :target
  has_many :users, through: :target_techniques
end
