class Project < ApplicationRecord
  belongs_to :category
  has_many :feedbacks, dependent: :destroy
  has_many :participates, dependent: :destroy
  has_many :users, through: :participates
  has_many :messages, dependent: :destroy
  has_many :rates, as: :target
  has_many :likes, as: :target
  has_many :images, as: :target
  has_many :targettechniques, as: :target
  has_many :comments, as: :target

  scope :order_by_newest, ->{order created_at: :desc}
end
