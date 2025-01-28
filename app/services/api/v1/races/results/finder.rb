module Api
  module V1
    module Races
      module Results
        class Finder < ApplicationService
          attr_reader :results

          def initialize(race_id:, result_params:)
            self.race_id = race_id
            self.result_params = result_params
          end

          def call
            fetch_race_results

            self
          end

          private

          attr_accessor :race_id, :result_params

          attr_writer :results

          def fetch_race_results
            race = Race.find(race_id)

            self.results = ActiveRecord::Base.transaction do
              result_params[:results].each do |result|
                lane = race.lanes.find_by(student_id: result[:student_id])
                lane.update(position: result[:position])
              end
            end

            true
          rescue ActiveRecord::RecordNotFound
            self.error_message = 'error on update race'

            false
          end
        end
      end
    end
  end
end
