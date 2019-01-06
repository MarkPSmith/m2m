require 'rails_helper'

RSpec.describe "foos#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/foos/#{foo.id}", payload
  end

  describe 'basic update' do
    let!(:foo) { create(:foo) }

    let(:payload) do
      {
        data: {
          id: foo.id.to_s,
          type: 'foos',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect(FooResource).to receive(:find).and_call_original
      expect {
        make_request
      }.to change { foo.reload.attributes }
      expect(response.status).to eq(200)
    end
  end
end
