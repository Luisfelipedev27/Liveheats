require 'rails_helper'

RSpec.describe Race, type: :model do
  describe 'associations' do
    it { is_expected.to have_many(:lanes).dependent(:destroy) }
    it { is_expected.to have_many(:students).through(:lanes) }
    it { is_expected.to accept_nested_attributes_for(:lanes) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_uniqueness_of(:name) }
  end

  describe 'custom validations' do
    it 'should have at least two students' do
      race = build(:race)

      expect(race).to be_invalid
      expect(race.errors[:base]).to include("A race must have at least two students")
    end
  end
end
