require 'rails_helper'

RSpec.describe Api::V1::UsersController, type: :request do
  describe 'user #show' do
    let!(:user) { FactoryBot.create(:user) }
    let(:credentials) { user.create_new_auth_token }
    let!(:plant) { FactoryBot.create(:plant, id: 4) }

    context 'validations' do
      it 'returns a valid request' do
        get "/api/v1/users/#{user.id}"
        expect(response.status).to eq 200
      end
    end

    context 'User' do
      before do
        user.plants.push Plant.all
        get "/api/v1/users/#{user.id}"
        @json_resp = response_json['data']
      end

      it 'should return user data' do
        expected_response = eval(file_fixture('user.txt').read)
        expect(response_json).to eq expected_response.as_json
      end

      it 'should return specific user' do
        expect(@json_resp['id']).to eq user.id.to_s
        expect(@json_resp['attributes']['email']).to eq user.email.to_s
      end
    end

    context 'User plant collection relation' do
      before do
        3.times { FactoryBot.create(:plant) }
        user.plants.push Plant.all
        get "/api/v1/users/#{user.id}"
        @json_resp = response_json['data']
      end

      it 'should return a collection of plants' do
        expect(@json_resp['relationships']['plants']['data'].count).to eq 4
      end

      it 'should include an image' do
        expect(@json_resp['relationships']['plants']['data'].first['plant']['image'])
          .not_to be nil
      end
    end
  end
end
