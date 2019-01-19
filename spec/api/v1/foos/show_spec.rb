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

  describe 'm2m fetch' do
    before :each do
      @foo1 = create(:foo)
      @foo2 = create(:foo)
      @foo3 = create(:foo)
      @foo1.children << @foo2
      @foo1.children << @foo3
      @foo1.save!
    end
    it 'sideloads the children, both relationships and includes' do
      jsonapi_get "/api/v1/foos/#{@foo1.id}?include=children", params: params
      expect(jsonapi_data.relationships["children"]["data"].length).to eq(2)
      expect(jsonapi_data.relationships["children"]["data"][0]["id"]).to eq("2")
      expect(jsonapi_data.relationships["children"]["data"][1]["id"]).to eq("3")

      expect(jsonapi_included.length).to eq(2)
      expect(jsonapi_included[0].attributes["id"]).to eq("2")
      expect(jsonapi_included[1].attributes["id"]).to eq("3")
    end
  end
end
