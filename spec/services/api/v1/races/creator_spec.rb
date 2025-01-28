require "rails_helper"

RSpec.describe Api::V1::Races::Creator do
  describe "#call" do
    context "when creating a race" do
      it "creates a race" do
        race_params = { name: "Race 1", lanes_attributes: [ { student_id: create(:student).id }, { student_id: create(:student).id } ] }

        service = described_class.call(race_params: race_params)

        expect(service).to be_success
      end
    end

    context "when creating a race with invalid params" do
      it "returns an error message" do
        service = described_class.call(race_params: { name: nil })

        expect(service).not_to be_success
        expect(service.error_message).to eq("error on create race")
      end
    end
  end
end
