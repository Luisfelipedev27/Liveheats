module Api
  module V1
    class RacesController < ApplicationController
      def index
        races = Race.all

        render json: races, status: :ok
      end

      def create
        service = Api::V1::Races::Creator.call(race_params: race_params)

        if service.success?
          head :created
        else
          render json: service.error_message, status: :unprocessable_entity
        end
      end

      def show
        service = Api::V1::Races::Finder.call(race_id: params[:id])

        if service.success?
          render json: service.race, status: :ok
        else
          render json: service.error_message, status: :not_found
        end
      end
      
      private

      def race_params
        params.require(:race).permit(:name, lanes_attributes: [:student_id])
      end
    end
  end
end
