class Post < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many :attachments, dependent: :destroy
  #has_many :rates, as: :target
  has_many :likes, as: :target
  has_many :comments, as: :target

  mount_uploader :image, ImageUploader

  enum target_type: {blog: 0, news: 1}

  scope :order_by_newest, ->{order created_at: :desc}
  scope :post_by_category_and_type, -> category_id, target_type do
    where category: category_id, target_type: target_type
  end
end
