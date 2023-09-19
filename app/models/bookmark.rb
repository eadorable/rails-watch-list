class Bookmark < ApplicationRecord
  belongs_to :movie
  belongs_to :list

  validates :comment, presence: true
  validates_length_of :comment, minimum: 6

  validates :list_id, uniqueness: { scope: :movie_id } # can be interchanged

  # Custom validation to ensure uniqueness for movie/list combination
  # validate :unique_movie_list_combination

  # private

  # def unique_movie_list_combination
  #   # you can check @bookmark.errors to retrieve and display the error messages.
  #   # movie_id: movie_id, list_id: list_id, value can be omitted
  #   errors.add(:base, 'This movie is already in the list') if Bookmark.exists?(movie_id:, list_id:)
  # end
end
