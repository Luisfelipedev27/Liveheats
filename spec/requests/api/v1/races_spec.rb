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
end
