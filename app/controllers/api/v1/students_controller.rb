module Api
  module V1
    class StudentsController < ApplicationController
      def index
        students = Student.all

        render json: students, status: :ok
      end
    end
  end
end
