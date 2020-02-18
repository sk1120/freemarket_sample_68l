class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string  :name, null: false, default: ""
      # t.references :saler, null: false, foreign_key: true
      # t.references :buyer, foreign_key: true
      # t.references :category, null: false, foreign_key: true
      # t.references :brand, null: false, foreign_key: true
      t.integer :condition, null: false
      t.string :postage, null: false
      t.string :shipping_means, null: false
      t.string :region, null: false
      t.string :shipping_date, null: false
      t.text :text, null: false
      t.integer :price, null: false
      t.timestamps
    end
  end
end
