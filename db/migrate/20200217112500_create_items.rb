class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string  :name, null: false, default: ""
      
      t.string :condition, null: false,default: "0"
      t.string :postage, null: false,default: "0"
      t.integer :shipping_means_id
      t.integer :prefecture_id, null: false
      t.integer :buyer_id
      t.string :shipping_date, null: false,default: "0"
      t.text :text, null: false
      t.integer :price, null: false
      t.integer :category_parent_id,null: false
      t.integer :category_child_id,null: false
      t.timestamps
    end
  end
end
