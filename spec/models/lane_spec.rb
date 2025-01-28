require 'rails_helper'

RSpec.describe Lane, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:race) }
    it { is_expected.to belong_to(:student) }
  end
end
