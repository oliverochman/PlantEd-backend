require 'rails_helper'

RSpec.describe UserPlant, type: :model do
  describe 'DB user plants' do
    it {is_expected.to have_db_column :id}
    it {is_expected.to have_db_column :user_id}
    it {is_expected.to have_db_column :plant_id}
    it {is_expected.to have_db_column :frequency}
    it {is_expected.to have_db_column :start_date}
  end

  describe 'Relations' do
    it {is_expected.to belong_to :user}
    it {is_expected.to belong_to :plant}
  end

  describe 'Validations' do
    it {is_expected.to validate_presence_of :user_id}
    it {is_expected.to validate_presence_of :plant_id}
  end

  describe 'instance methods' do
    it {is_expected.to respond_to :schedule}

    let!(:user) {FactoryBot.create(:user)}
    let!(:plant_1) {FactoryBot.create(:plant, name: 'Snake plant')}
    subject {FactoryBot.create(:user_plant, user: user, plant: plant_1, frequency: 5)}

    it 'creates a IceCube schedule' do
      expect(subject.schedule).to be_a IceCube::Schedule
    end

    it 'run every 5 days for 30 days' do
      expect(subject.schedule.rrules).to eq [IceCube::Rule.daily(5).until(Date.today + 30)]
    end

    context '#send_notification' do
      subject {create(:user_plant, frequency: 5, user: user, plant: plant_1)}
      let(:action_cable) {ActionCable.server}

      it 'broadcast notification to user\'s channel ' do
        expect(action_cable).to receive(:broadcast).with("notifications_#{user.id}", {notification: 'User, Snake plant needs to be watered!', user_id: user.id} )
        subject.send_notification
      end

    end
  end
end
