require 'rails_helper'

RSpec.describe UserPlant, type: :model do
  describe 'DB user plants' do
    it {is_expected.to have_db_column :id }
    it {is_expected.to have_db_column :user_id }
    it {is_expected.to have_db_column :plant_id }
    it {is_expected.to have_db_column :frequency }
    it {is_expected.to have_db_column :anchor }
  end

  describe 'Relations' do
    it {is_expected.to belong_to :user}
    it {is_expected.to belong_to :plant}
  end

  describe 'Validations' do
   it { is_expected.to validate_presence_of :user_id }
   it { is_expected.to validate_presence_of :plant_id }
 end
end
