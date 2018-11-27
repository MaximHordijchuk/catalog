class Category < ApplicationRecord
  has_many :items, dependent: :destroy, inverse_of: :category

  validates :name, :alias, presence: true

  def to_param
    self.alias
  end

  def as_json(options)
    super({ only: %i[name alias] }.merge(options))
  end
end
