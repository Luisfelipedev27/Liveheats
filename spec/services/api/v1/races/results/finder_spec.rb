require "rails_helper"

RSpec.describe Api::V1::Races::Results::Finder do
  describe "#call" do
    context "when finding race results" do
      it "finds race results" do
        student_1 = create(:student)
        student_2 = create(:student)

        race = create(:race, students: [ student_1, student_2 ])

        result_params = {
          results: [
            { student_id: student_1.id, position: 1 },
            { student_id: student_2.id, position: 2 }
          ]
        }

        service = described_class.call(race_id: race.id, result_params: result_params)

        expect(service).to be_success
        expect(service.results).to eq(
          [
            { student_id: race.students.first.id, position: 1 },
            { student_id: race.students.second.id, position: 2 }
          ]
        )
      end
    end

    context "when finding race results that do not exist" do
      it "returns an error message" do
        service = described_class.call(race_id: 1, result_params: { results: [ { student_id: 10, position: 1 }, { student_id: 13, position: 2 } ] })

        expect(service).not_to be_success
        expect(service.error_message).to eq("error on update race")
      end
    end

    context "when finding race results" do
      it "returns error message when there is a duplicated position" do
        student_1 = create(:student)
        student_2 = create(:student)

        race = create(:race, students: [ student_1, student_2 ])

        result_params = {
          results: [
            { student_id: student_1.id, position: 1 },
            { student_id: student_2.id, position: 1 }
          ]
        }

        service = described_class.call(race_id: race.id, result_params: result_params)

        expect(service).not_to be_success
        expect(service.error_message).to eq("error on update race")
      end
    end
  end
end
