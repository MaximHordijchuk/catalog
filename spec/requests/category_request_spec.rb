require 'rails_helper'

describe 'Category', type: :request do
  describe 'index' do
    it 'should return categories' do
      categories = create_list(:category, 5)

      get category_path(categories.first, 1)

      expect(response.status).to eq 200
      expect(response_body[:categories]).to be_present
      expect(response_body[:categories].size).to eq categories.size
    end

    it 'should return correct category fields' do
      category = create(:category)

      get category_path(category, 1)

      expect(response.status).to eq 200
      expect(response_body[:categories].first[:name]).to eq category.name
      expect(response_body[:categories].first[:alias]).to eq category.alias
    end

    it 'should return items' do
      category = create(:category, :with_items)

      get category_path(category, 1)

      expect(response.status).to eq 200
      expect(response_body[:items]).to be_present
      expect(response_body[:items].size).to eq category.items.page(1).size
    end

    it 'should return correct item fields' do
      item = create(:item)

      get category_path(item.category, 1)

      expect(response.status).to eq 200
      expect(response_body[:items].first[:name]).to eq item.name
      expect(response_body[:items].first[:slug]).to eq item.slug
      expect(response_body[:items].first[:price]).to eq item.price.to_s
      expect(response_body[:items].first[:description]).to eq item.description
    end

    it 'should return pagination' do
      category = create(:category)
      category.items = create_list(:item, 25)

      get category_path(category, 2)

      expect(response.status).to eq 200
      expect(response_body[:pagination]).to be_present
      expect(response_body[:pagination][:current_page]).to eq 2
      expect(response_body[:pagination][:next_page]).to eq 3
      expect(response_body[:pagination][:prev_page]).to eq 1
      expect(response_body[:pagination][:total_pages]).to eq 3
      expect(response_body[:pagination][:total_count]).to eq 25
    end
  end
end
