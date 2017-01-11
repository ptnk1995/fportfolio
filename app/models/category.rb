class Category < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :projects, dependent: :destroy
end
