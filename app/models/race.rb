class Race < ApplicationRecord
  has_many :lanes, dependent: :destroy
  has_many :students, through: :lanes

  validates :name, presence: true, uniqueness: true
  validate :minimum_two_students

  accepts_nested_attributes_for :lanes

  private

  def minimum_two_students
    errors.add(:base, "A race must have at least two students") if lanes.size < 2
  end
end
