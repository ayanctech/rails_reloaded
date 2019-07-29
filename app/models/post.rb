class Post < ApplicationRecord
  has_one_attached :picture
  validates :title, presence: true
  validate :correct_image

  private
  def correct_image
    if picture.attached?
      true
    else
      errors.add(:picture,"should be attached !")
    end
  end
end
