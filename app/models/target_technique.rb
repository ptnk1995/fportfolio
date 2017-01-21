class TargetTechnique < ApplicationRecord
  belongs_to :technique
  belongs_to :project
  belongs_to :target, polymorphic: true
end
