class Movie < ApplicationRecord
  belongs_to :user
  has_many :reviews
  has_one_attached :image
  scope :search, lambda {|query| where(["title LIKE ?","%#{query}%"])}

  validates :title, :description, :movie_length, :director, :rating,   presence: true
  validate :correct_image_type

  private

  def correct_image_type
    if image.attached? && !image.content_type.in?(%w(image/jpeg image/png))
      errors.add(:image, 'must be a JPEG or PNG')
    elsif image.attached? == false
          errors.add(:image, 'Please select Image ')
    end
  end

end
