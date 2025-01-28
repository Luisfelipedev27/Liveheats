class Lane < ApplicationRecord
  belongs_to :race
  belongs_to :student

  validates :student_id, uniqueness: { scope: :race_id, case_sensitive: false, message: "should be unique within a race" }
  validates :position, uniqueness: { scope: :race_id, case_sensitive: false, message: "should be unique within a race" }
end
