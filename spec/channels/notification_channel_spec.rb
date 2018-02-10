require 'rails_helper'

RSpec.describe NotificationChannel, type: :channel do

  let!(:user) {create(:user)}

  before do
    subscribe(user_id: user.id)
  end

  it 'rejects subscription without user_id' do
    stub_connection user_id: nil
    subscribe
    expect(subscription).to be_rejected
  end

  it 'sets up subscription' do
    expect(subscription).to be_confirmed
  end

  it 'sets up unique stream' do
    expect(streams).to include("notifications_#{user.id}")
  end

  it 'matches with stream name' do
    expect {
      ActionCable.server.broadcast(
          'notifications_2', notification: 'Whatever!'
      )
    }.to have_broadcasted_to('notifications_2').with({notification: 'Whatever!'})
  end
end
