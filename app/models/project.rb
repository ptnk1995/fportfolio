class Project < ApplicationRecord
  belongs_to :category
  has_many :feedbacks, dependent: :destroy
  has_many :participates, dependent: :destroy
  has_many :users, through: :participates
  has_many :messages, dependent: :destroy
  has_many :likes, as: :target
  has_many :images, as: :target
  has_many :targettechniques, as: :target
  has_many :comments, as: :target

  scope :order_by_newest, ->{order created_at: :desc}

  accepts_nested_attributes_for :images, allow_destroy: true

  validate :check_max_files
  validates :name, presence: true
  validates :url, presence: true
  validates :description, presence: true
  validates :realease_note, presence: true
  validates :git_repository, presence: true
  validates :server_information, presence: true
  validates :platform, presence: true
  validates :core_features, presence: true

  ratyrate_rateable :rating

  PRIVATE_ATTRIBUTES = {server_information: "server_information",
    git_repository: "git_repository", pm_url: "pm_url"}

  private
  def check_max_files
    if images.blank? || images.size > Settings.project.max_image_files
      errors.add(:dagger, I18n.t("projects.check_max_files"))
    end
  end
end
