require 'rails_helper'

RSpec.describe Api::V1::UserPlantsController, type: :request do
  let!(:user) { FactoryBot.create(:user) }
  let(:credentials) { user.create_new_auth_token }
  let(:headers) { { HTTP_ACCEPT: 'application/json' }.merge!(credentials) }

  let!(:plant_1) { FactoryBot.create(:plant, name: 'Snake plant') }
  let!(:plant_2) { FactoryBot.create(:plant, name: 'Aloe Vera') }

  it 'creates a user plant list' do
    post "/api/v1/users/#{user.id}/user_plants", params: { plant_id: plant_1.id },
    headers: headers
    expect(response.status).to eq 200
    expect(user.user_plants.first.plant.name).to eq 'Snake plant'
  end

  context 'Validations' do
    it 'has a valid plant id' do
      post "/api/v1/users/#{user.id}/user_plants", params: { plant_id: nil },
      headers: headers
      expect(response.status).to eq 400
    end

    it 'has a valid user id' do
      post "/api/v1/users/#{user.id}/user_plants", params: { user_id: nil },
      headers: headers
      expect(response.status).to eq 400
    end
  end

  context 'User plant collection' do
    it 'can add many plants in the collection' do
      post "/api/v1/users/#{user.id}/user_plants", params: { plant_id: plant_1.id },
      headers: headers
      post "/api/v1/users/#{user.id}/user_plants", params: { plant_id: plant_2.id },
      headers: headers
      binding.pry
      expect(user.user_plants.count).to eq 2
    end
  end
end
