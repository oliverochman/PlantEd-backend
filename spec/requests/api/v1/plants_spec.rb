require 'rails_helper'

RSpec.describe Api::V1::PlantsController, type: :request do
  describe 'GET /v1/plants' do
    context 'with anonymous doubles' do

      before do
        3.times { FactoryBot.create(:plant) }
      end

      it 'should return a collection of plants' do
        get '/api/v1/plants'
        expect(response.status).to eq 200
        expect(response_json['data'].count).to eq 3
      end
    end

    context 'returns specific plant' do
      let!(:myplants) {FactoryBot.create(:plant, name: 'Aloe Vera',
                                                 description: 'The Aloe Vera plant is great')}
      before do
        get '/api/v1/plants'
        @json_resp = JSON.parse(response.body)['data'].first
      end

      it 'includes plant attributes' do
        expect(@json_resp['attributes']['name']).to eq 'Aloe Vera'
        expect(@json_resp['attributes']['description']).to eq 'The Aloe Vera plant is great'
      end
    end
  end
end
