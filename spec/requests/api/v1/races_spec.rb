require 'rails_helper'

RSpec.describe 'api/v1/races', type: :request do
  describe 'POST /' do
    context 'when the request is valid' do
      it 'creates a race' do
        race_params = { name: 'Race 1', lanes_attributes: [{ student_id: create(:student).id }, { student_id: create(:student).id }] }

        post '/api/v1/races', params: { race: race_params }

        expect(response).to have_http_status(:created)
      end
    end

    context 'when the request is invalid' do
      it 'returns an error message' do
        post '/api/v1/races', params: { race: { name: nil } }

        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'GET /' do
    context 'when there are races' do
      it 'returns all races' do
        create(:race, students: [create(:student), create(:student)])

        get '/api/v1/races'

        expect(response).to have_http_status(:ok)
      end
    end

    context 'when there are no races' do
      it 'returns an empty array' do
        Race.destroy_all

        get '/api/v1/races'

        expect(response).to have_http_status(:ok)
        expect(response.body).to eq('[]')
      end
    end
  end
end
