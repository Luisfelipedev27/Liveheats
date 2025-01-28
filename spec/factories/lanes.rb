FactoryBot.define do
  factory :lane do
    association :race
    association :student
    position { 1 }
  end
end
