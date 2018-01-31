require 'rails_helper'

RSpec.describe UserPlant, type: :model do
  describe 'DB user plants' do
    it {is_expected.to have_db_column :id }
    it {is_expected.to have_db_column :user_id }
    it {is_expected.to have_db_column :plant_id }
  end

  describe 'Relation' do
    it {is_expected.to belong_to :user}
    it {is_expected.to belong_to :plant}
  end
end
