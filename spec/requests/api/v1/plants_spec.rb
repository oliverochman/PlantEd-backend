require 'rails_helper'

RSpec.describe Api::V1::PlantsController, type: :request do
  describe 'GET /v1/plants' do

    before do
      5.times { FactoryBot.create(:plant) }
    end

    it 'should return a collection of plants' do
      get '/api/v1/plants'
      expect(JSON.parse(responses.body)['data'].count).to eq 5
    end
  end
end