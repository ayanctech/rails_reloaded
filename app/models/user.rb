class User < ApplicationRecord
  scope :sorted, -> { order("name ASC") }
  scope :search, ->(query) { where("name LIKE ? OR email LIKE?", "%#{query}%".titleize, "%#{query}%")}

  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :email, presence: true, uniqueness: true, format: { with: /\A[a-zA-Z0-9\.]+\@[a-zA-Z]+\.[a-zA-Z]+\z/ }

  before_save :sanitize_name

  def sanitize_name
    self.name = self.name.titleize
  end

end
