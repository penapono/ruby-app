describe BrandsController do
  let(:brand) { FactoryGirl.create(:brand) }

  describe 'exposes' do
    it 'brands' do
      expect(controller.brands).to eq([brand])
    end
  end

  describe 'index' do
    it 'brands' do
      expect(controller.brands).to eq([brand])
    end

    describe 'template' do
      render_views
      before { get(:index) }

      it { is_expected.to respond_with(:success) }
      it { is_expected.to render_template :index }
    end
  end
end
