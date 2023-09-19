class Movie < ApplicationRecord
  #  should not be able to destroy self if has bookmarks children(Rails 6.1)
  has_many :bookmarks, dependent: :destroy_async
  has_many :lists, through: :bookmarks

  validates :overview, presence: true
  validates :title, presence: true, uniqueness: true
  # without allow_nil: true, uniquness will fail
  validates :rating, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 10 }, allow_nil: true
end
