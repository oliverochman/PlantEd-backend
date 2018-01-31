require 'rails_helper'

RSpec.describe Plant, type: :model do
  describe 'Database table for Plant' do
    it { is_expected.to have_db_column :id }
    it { is_expected.to have_db_column :name }
    it { is_expected.to have_db_column :description }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_presence_of :description }
  end

  describe 'Relation' do
    it { is_expected.to have_many :user_plants }
    it { is_expected.to have_many :users }
  end

  describe 'Factory' do
    it 'should be valid' do
      expect(create(:plant)).to be_valid
    end
  end
end
