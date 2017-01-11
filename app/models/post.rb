class Post < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many :attachments, dependent: :destroy
  has_many :rates, as: :target
  has_many :likes, as: :target
  has_many :comments, as: :target
end
