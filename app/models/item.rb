class Item < ApplicationRecord
  extend FriendlyId

  belongs_to :category, inverse_of: :items

  friendly_id :name, use: :slugged

  default_scope { order(created_at: :desc) }

  validates :category, :name, :slug, presence: true
  validates :description, exclusion: { in: [nil] }
  validates :price, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 9_999_999_999 }, allow_nil: true

  def to_param
    slug
  end

  def as_json(options)
    super({ only: %i[name price description slug] }.merge(options))
  end
end
