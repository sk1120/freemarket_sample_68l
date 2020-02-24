class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string  :name, null: false, default: ""
      
      # t.references :saler, null: false, foreign_key: {to_table: :users}
      # t.references :buyer, foreign_key: {to_table: :users}
      # t.references :category, null: false, foreign_key: { to_table: :categories}
      # t.references :brand, null: false, foreign_key: { to_table: :brands}

      t.string :condition, null: false,default: "0"
      t.string :postage, null: false,default: "0"
      t.integer :shipping_means_id
      t.integer :prefecture_id, null: false
      t.integer :buyer_id
      t.string :shipping_date, null: false,default: "0"
      t.text :text, null: false
      t.integer :price, null: false
      t.timestamps
    end
  end
end
