require 'rails_helper'

describe 'Item', type: :request do
  describe 'show' do
    it 'should return item' do
      item = create(:item)

      get item_path(item, 1)

      expect(response.status).to eq 200
      expect(response_body[:name]).to eq item.name
      expect(response_body[:price]).to eq item.price.to_s
      expect(response_body[:description]).to eq item.description
      expect(response_body[:slug]).to eq item.slug
    end
  end
end
