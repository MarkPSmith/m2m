require 'rails_helper'

RSpec.describe FooResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'foos',
          attributes: { }
        }
      }
    end

    let(:instance) do
      FooResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true)
      }.to change { Foo.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:foo) { create(:foo) }

    let(:payload) do
      {
        data: {
          id: foo.id.to_s,
          type: 'foos',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      FooResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { foo.reload.updated_at }
      # .and change { foo.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:foo) { create(:foo) }

    let(:instance) do
      FooResource.find(id: foo.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { Foo.count }.by(-1)
    end
  end
end
