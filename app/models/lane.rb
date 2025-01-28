class Lane < ApplicationRecord
  belongs_to :race
  belongs_to :student

  validates :student_id, uniqueness: { scope: :race_id, message: "should be unique within a race" }
end
