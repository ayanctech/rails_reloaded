class Post < ApplicationRecord
  has_one_attached :picture
  validates :title, presence: true
  validate :correct_image

  private
  def correct_image
    unless picture.attached?
      errors.add(:picture,"should be attached !")
    end
  end

end
