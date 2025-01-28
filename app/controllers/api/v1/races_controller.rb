module Api
  module V1
    class RacesController < ApplicationController
      def create
        service = Api::V1::Races::Creator.call(race_params: race_params)

        if service.success?
          head :created
        else
          render json: service.error_message, status: :unprocessable_entity
        end
      end

      private

      def race_params
        params.require(:race).permit(:name, lanes_attributes: [:student_id])
      end
    end
  end
end
