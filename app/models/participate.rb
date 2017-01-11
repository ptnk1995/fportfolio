class Participate < ApplicationRecord
  belongs_to :user
  belongs_to :project
  has_many :rate, as: :target
end
