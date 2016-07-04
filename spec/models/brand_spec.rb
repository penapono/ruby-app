require 'rails_helper'

describe Brand do
  let(:brand) { build(:brand) }

  describe 'associations' do
    it do
      is_expected.to have_many(:models).dependent(:destroy)
    end
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of :webmotors_id }
    it { is_expected.to validate_presence_of :name }
  end
end
