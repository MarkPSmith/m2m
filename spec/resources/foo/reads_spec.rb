require 'rails_helper'

RSpec.describe FooResource, type: :resource do
  describe 'serialization' do
    let!(:foo) { create(:foo) }

    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(foo.id)
      expect(data.jsonapi_type).to eq('foos')
    end
  end

  describe 'filtering' do
    let!(:foo1) { create(:foo) }
    let!(:foo2) { create(:foo) }

    context 'by id' do
      before do
        params[:filter] = { id: { eq: foo2.id } }
      end

      it 'works' do
        render
        expect(d.map(&:id)).to eq([foo2.id])
      end
    end
  end

  describe 'sorting' do
    describe 'by id' do
      let!(:foo1) { create(:foo) }
      let!(:foo2) { create(:foo) }

      context 'when ascending' do
        before do
          params[:sort] = 'id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            foo1.id,
            foo2.id
          ])
        end
      end

      context 'when descending' do
        before do
          params[:sort] = '-id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            foo2.id,
            foo1.id
          ])
        end
      end
    end
  end

  describe 'sideloading' do
    # ... your tests ...
  end
end
