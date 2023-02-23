class Bookmark < ApplicationRecord
  belongs_to :list
  belongs_to :movie

  validates :comment, length: { minimum: 6 }
  validates :movie_id, uniqueness: { scope: :list_id, message: "has already been bookmarked in this list" }

  validate :movie_and_list_presence

  def movie_and_list_presence
    if movie.blank? || list.blank?
      errors.add(:base, "A bookmark must be linked to a movie and a list")
    end
  end
end
