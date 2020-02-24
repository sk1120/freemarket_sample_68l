class AddAncestryToCategories < ActiveRecord::Migration[5.2]
  def change
    add_reference :brands, :category, foreign_key: { to_table: :categories }
  end
end
