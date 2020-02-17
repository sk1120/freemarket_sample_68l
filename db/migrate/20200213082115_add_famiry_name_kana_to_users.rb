class AddFamiryNameKanaToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :family_name_kana, :string, null: false
  end
end
