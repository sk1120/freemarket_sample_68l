class AddSalerIdToItems < ActiveRecord::Migration[5.2]
  def change
    add_reference :items, :saler, foreign_key: { to_table: :users } , null: false
    add_reference :items, :category_grand_child, foreign_key: { to_table: :categories}, null: false
    add_reference :items, :brand , foreign_key: true , null: false
  end
end
