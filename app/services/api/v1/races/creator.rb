module Api
  module V1
    module Races
      class Creator < ApplicationService
        def initialize(race_params:)
          self.race_params = race_params
        end

        def call
          create_race

          self
        end

        private

        attr_accessor :race_params

        def create_race
          race = Race.new(race_params)

          return true if race.save

          self.error_message = "error on create race"
        end
      end
    end
  end
end
