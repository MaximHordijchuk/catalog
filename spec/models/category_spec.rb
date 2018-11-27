require 'rails_helper'

describe Category, type: :model do
  subject { build :category }

  it 'should be valid with factory attributes' do
    should be_valid
  end

  it 'should have relations' do
    should have_many(:items).dependent(:destroy)
  end

  context 'should have basic validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :alias }
  end
end
