class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :socials, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :participates, dependent: :destroy
  has_many :projects, through: :participates
  has_many :messages, dependent: :destroy
  has_many :certificate_users, dependent: :destroy
  has_many :rates, as: :target
  has_many :likes, as: :target
  has_many :images, as: :target
  has_many :target_techniques, as: :target

  validates :name, presence: true, length: {maximum: Settings.user.name}

end
