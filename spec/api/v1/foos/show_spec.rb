require 'rails_helper'

RSpec.describe "foos#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/foos/#{foo.id}", params: params
  end

  describe 'basic fetch' do
    let!(:foo) { create(:foo) }

    it 'works' do
      expect(FooResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('foos')
      expect(d.id).to eq(foo.id)
    end
  end
end
