class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.references :category, foreign_key: true
      t.string :name, null: false
      t.decimal :price, precision: 12, scale: 2
      t.string :description, null: false, default: ''
      t.string :slug, index: { unique: true }

      t.timestamps
    end
  end
end
