class Post < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many :attachments, dependent: :destroy
  #has_many :rates, as: :target
  has_many :likes, as: :target
  has_many :comments, as: :target

  enum target_type: {blog: 0, post: 1}
  scope :order_by_newest, ->{order created_at: :desc}

  scope :get_blog, -> target_type do
    where target_type: target_type
  end
end
