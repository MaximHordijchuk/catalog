require 'rails_helper'

describe Item, type: :model do
  subject { build :item }

  it 'should be valid with factory attributes' do
    should be_valid
  end

  it 'should have relations' do
    should belong_to(:category)
  end

  context 'should have basic validations' do
    it { should validate_presence_of :category }
    it { should validate_presence_of :name }
    it { should validate_exclusion_of(:description).in_array([nil]) }
    it do
      should validate_numericality_of(:price).is_greater_than_or_equal_to(0)
                                             .is_less_than_or_equal_to(9_999_999_999)
                                             .allow_nil
    end
  end
end
