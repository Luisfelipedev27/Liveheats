require 'rails_helper'

RSpec.describe 'api/v1/students', type: :request do
  describe 'GET /' do
    context 'when there are students' do
      it 'returns all students' do
        create(:student)

        get '/api/v1/students'

        expect(response).to have_http_status(:ok)
      end
    end

    context 'when there are no students' do
      it 'returns an empty array' do
        Student.destroy_all

        get '/api/v1/students'

        expect(response).to have_http_status(:ok)
        expect(response.body).to eq('[]')
      end
    end
  end
end
