require "rails_helper"

RSpec.describe Api::V1::Races::Finder do
  describe "#call" do
    context "when finding a race" do
      it "finds a race" do
        race = create(:race, students: [create(:student), create(:student)])

        service = described_class.call(race_id: race.id)

        expect(service).to be_success
        expect(service.race).to eq(
          {
            id: race.id,
            name: race.name,
            results: [
              { student: race.students.first.name, position: nil },
              { student: race.students.second.name, position: nil }
            ]
          }
        )
      end
    end

    context "when finding a race that does not exist" do
      it "returns an error message" do
        service = described_class.call(race_id: 1)

        expect(service).not_to be_success
        expect(service.error_message).to eq("error on find race")
      end
    end
  end
end
