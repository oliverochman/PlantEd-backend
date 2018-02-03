require 'rails_helper'

RSpec.describe Api::V1::UsersController, type: :request do
  describe 'user #show' do
    

    it 'should return specific user' do
      get "api/api/v1/users/#{user.id}"
      should email
      should id
    end

    it 'should return specific users plants' do
      get "api/api/v1/users/#{user.id}"
      should name
      should plant.count
      should description
    end

    it 'validates relation' do
      with user and plant
    end

    it 'Valid request' do
      get "api/api/v1/users/#{user.id}"
      expect(response.status).to eq 200
    end
  end
end
