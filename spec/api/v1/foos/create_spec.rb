require 'rails_helper'

RSpec.describe "foos#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/api/v1/foos", payload
  end

  describe 'basic create' do
    let(:payload) do
      {
        data: {
          type: 'foos',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    it 'works' do
      expect(FooResource).to receive(:build).and_call_original
      expect {
        make_request
      }.to change { Foo.count }.by(1)
      expect(response.status).to eq(201)
    end
  end
end
