require 'rails_helper'

RSpec.describe Plant, type: :model do
  describe 'Database table for Plant' do
    it { is_expected.to have_db_column :id }
    it { is_expected.to have_db_column :name }
    it { is_expected.to have_db_column :description }
  end
end
