require 'rails_helper'

RSpec.describe "foos#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/foos", params: params
  end

  describe 'basic fetch' do
    let!(:foo1) { create(:foo) }
    let!(:foo2) { create(:foo) }

    it 'works' do
      expect(FooResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.map(&:jsonapi_type).uniq).to match_array(['foos'])
      expect(d.map(&:id)).to match_array([foo1.id, foo2.id])
    end
  end
end
