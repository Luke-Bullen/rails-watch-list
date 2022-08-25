class Bookmark < ApplicationRecord
  validates :comment, presence: true, length: { minimum: 6 }
  validates :movie_id, presence: true, uniqueness: { scope: :list_id }
  validates :list_id, presence: true, uniqueness: { scope: :movie_id }

  belongs_to :movie
  belongs_to :list
end
