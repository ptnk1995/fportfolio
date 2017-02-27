class Category < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :projects, dependent: :destroy

  enum target_type: {blog: 0, news: 1, project: 2}

  validates :name, presence: true
  validates :target_type, presence: true
end
