require 'rails_helper'

RSpec.describe Notification, type: :model do
  describe 'Database table for Notifiction' do
    it { is_expected.to have_db_column :content }
    it { is_expected.to have_db_column :user_id }
  end

  describe 'Relations' do
    it {is_expected.to belong_to :user}
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of :content }
  end
end
