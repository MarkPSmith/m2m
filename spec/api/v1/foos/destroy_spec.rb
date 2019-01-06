require 'rails_helper'

RSpec.describe "foos#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/foos/#{foo.id}"
  end

  describe 'basic destroy' do
    let!(:foo) { create(:foo) }

    it 'updates the resource' do
      expect(FooResource).to receive(:find).and_call_original
      expect { make_request }.to change { Foo.count }.by(-1)
      expect { foo.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(response.status).to eq(200)
      expect(json).to eq('meta' => {})
    end
  end
end
