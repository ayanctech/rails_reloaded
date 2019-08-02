class Student < ApplicationRecord
  validates :name, uniqueness: true
  validates :email, uniqueness: true
  validates :phone, uniqueness: true
end
