require 'rails_helper'

RSpec.describe Api::V1::UsersController, type: :request do
  describe 'user #show' do
     let!(:user) { FactoryBot.create(:user)}
     let(:credentials) { user.create_new_auth_token }
     let!(:plant) {FactoryBot.create(:plant)}

     before do
       user.plants.push Plant.all
       get "/api/v1/users/#{user.id}"
       @json_resp = response_json['data']
     end

     context 'validations' do
       it 'returns a valid request' do
         expect(response.status).to eq 200
       end
     end

     context 'User' do
       it 'should return user data' do
         expected_response = eval(file_fixture('user.txt').read)
         expect(response_json).to eq expected_response.as_json
       end

       it 'should return specific user' do
         expect(@json_resp['id']).to eq "#{user.id}"
         expect(@json_resp['attributes']['email']).to eq "#{user.email}"
       end
     end

     context 'User plant collection' do
        it 'should return a collection of plants' do
          expect(@json_resp['relationships'].count).to eq 1
        end
     end

    # it 'should return specific users plants' do
    #   get "api/api/v1/users/#{user.id}"
    #   should name
    #   should plant.count
    #   should description
    # end
    #
    # it 'validates relation' do
    #   with user and plant
    # end
  end
end
