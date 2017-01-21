class Message < ApplicationRecord
  belongs_to :user
  belongs_to :project

  def timestamp
    created_at.strftime Settings.format.time
  end
end
