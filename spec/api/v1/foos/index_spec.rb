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

  describe 'm2m fetch' do
    let!(:foo1) {create (:foo)}
    let!(:foo2) {create (:foo)}
    let!(:foo3) {create (:foo)}

    it 'fetches the children of foo1' do
      foo1.children << foo2 << foo3
      jsonapi_get '/api/v1/foos?include=children'
      expect(jsonapi_data[0].relationships["children"]["data"].length).to eq(2)
      expect(jsonapi_included.length).to eq(2)
    end

    it 'fetches no children for foo2' do
      foo1.children << foo2 << foo3
      jsonapi_get '/api/v1/foos?include=children'
      expect(jsonapi_data[1].relationships["children"]["data"].length).to eq(0)
    end

    it 'fetches no children for foo3' do
      foo1.children << foo2 << foo3
      jsonapi_get '/api/v1/foos?include=children'
      expect(jsonapi_data[2].relationships["children"]["data"].length).to eq(0)
    end
  end
end
