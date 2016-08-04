class Review < ApplicationRecord
  belongs_to :user
  belongs_to :attraction

  default_scope -> { order(created_at: :desc) }

  validates :title, presence: true
  validates :rating, :numericality => {:greater_than =>0 }, unless: :comments
  validates :comments, presence: true, unless: :rating
end
