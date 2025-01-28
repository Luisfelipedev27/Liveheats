class Race < ApplicationRecord
  has_many :lanes, dependent: :destroy
  has_many :students, through: :lanes

  validates :name, presence: true, uniqueness: true
end
