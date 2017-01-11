class Comment < ApplicationRecord
  belongs_to :target, polymorphic: true
end
