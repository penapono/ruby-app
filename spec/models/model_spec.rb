require 'rails_helper'

describe Model do
  let(:model) { build(:model) }

  describe 'associations' do
    it { is_expected.to belong_to :brand }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of :brand_id }
    it { is_expected.to validate_presence_of :name }
  end
end
