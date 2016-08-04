class Review < ApplicationRecord
  belongs_to :user
  belongs_to :attraction

  default_scope -> { order(created_at: :desc) }

  validates :title, presence: true
end
