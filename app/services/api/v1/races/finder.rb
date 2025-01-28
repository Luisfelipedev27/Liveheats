module Api
  module V1
    module Races
      class Finder < ApplicationService
        attr_reader :race

        def initialize(race_id:)
          self.race_id = race_id
        end

        def call
          find_race

          self
        end

        private

        attr_accessor :race_id

        attr_writer :race

        def find_race
          race = Race.includes(:lanes, :students).find(race_id)

          self.race = race_json(race) if race

          true
        rescue ActiveRecord::RecordNotFound
          self.error_message = "error on find race"

          false
        end

        def race_json(race)
          {
            id: race.id,
            name: race.name,
            results: race.lanes.order(:position).map do |lane|
              {
                student: lane.student.name,
                position: lane.position
              }
            end
          }
        end
      end
    end
  end
end
