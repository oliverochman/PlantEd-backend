require 'rails_helper'

RSpec.describe NotificationChannel, type: :channel do

  let!(:user) {create(:user)}

  before do
    stub_connection user_id: user.id
    subscribe(user_id: user.id)
  end

  it 'sets up subscription' do
    expect(subscription).to be_confirmed
  end

  it 'sets up unique stream' do
    expect(streams).to include("notifications_#{user.id}")
  end
end
