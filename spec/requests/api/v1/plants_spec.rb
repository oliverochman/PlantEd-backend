require 'rails_helper'

RSpec.describe Api::V1::PlantsController, type: :request do
  describe 'GET /v1/plants' do

    before do
      3.times { FactoryBot.create(:plant) }
    end

    it 'should return a collection of plants' do
      get '/api/v1/plants'
      expect(response.status).to eq 200
      expect(response_json['data'].count).to eq 3
    end
  end
end