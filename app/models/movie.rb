class Movie < ApplicationRecord
  belongs_to :user
  has_many :reviews
  has_one_attached :image
  scope :search, lambda {|query| where(["title LIKE ?","%#{query}%"])}

  validates :title, :description, :movie_length, :director, :rating, :image, presence: true
end
