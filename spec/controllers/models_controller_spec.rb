require 'rails_helper'

describe ModelsController do
  let(:brand) { FactoryGirl.create(:brand) }
  let(:other_brand) { FactoryGirl.create(:brand) }
  let(:model) { FactoryGirl.create(:model, brand: brand) }
  let(:other_model) { FactoryGirl.create(:model, brand: other_brand) }

  describe 'index' do
    before { get(:index, brand_id: brand.id) }

    it { expect(controller.brand).to eq(brand) }
    it { expect(controller.brand).not_to eq(other_brand) }

    it { expect(controller.models).to eq([model]) }
    it { expect(controller.models).not_to eq([other_model]) }

    describe 'template' do
      render_views
      before { get(:index, brand_id: brand.id) }

      it { is_expected.to respond_with(:success) }
      it { is_expected.to render_template :index }
    end
  end
end
