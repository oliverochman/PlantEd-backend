require 'rails_helper'

RSpec.describe Api::V1::UserPlantsController, type: :request do
  let!(:user) { FactoryBot.create(:user) }
  let(:credentials) { user.create_new_auth_token }
  let(:headers) { { HTTP_ACCEPT: 'application/json' }.merge!(credentials) }

  let!(:plant_1) { FactoryBot.create(:plant, name: 'Snake plant') }
  let!(:plant_2) { FactoryBot.create(:plant, name: 'Aloe Vera') }
  let!(:user_plant) {FactoryBot.create(:user_plant, user: user, plant: plant_1)}

  context 'Successfull updates' do
    before do
      put "/api/v1/users/#{user.id}/user_plants/#{user_plant.id}",
      params: { frequency: 5 },
      headers: headers
      user_plant.reload
    end

    it 'sets frequency to 5' do
      expect(user_plant.frequency).to eq 5
    end

    it 'creates a IceCube schedule' do
      expect(user_plant.schedule).to be_a IceCube::Schedule
    end

    it 'run every 5 days for 30 days' do
      expect(user_plant.schedule.rrules).to eq [IceCube::Rule.daily(5).until(Date.today + 30)]
    end

    it 'returns 200' do
      expect(response.status).to eq 200
    end

    it 'returns success message' do
      expect(response_json['status']).to eq 'success'
    end
  end

  context 'Unsuccessfull updates' do
    before do
      put "/api/v1/users/#{user.id}/user_plants/#{user_plant.id}",
          headers: headers
      user_plant.reload
    end

    it 'does not set the frequency' do
      expect(user_plant.frequency).to eq nil
    end

    it 'returns 400' do
      expect(response.status).to eq 400
    end

    it 'returns error message' do
      expect(response_json['error']).to eq 'Please add your plants water needs'
    end
  end
end
