crumb :root do
  link "トップページ", root_path
end

crumb :mypage do
  link "マイページ", "/users/#{current_user.id}"
end

crumb :logout do
  link "ログアウト", logout_user_path(current_user)
  parent :mypage 
end

crumb :card do
  link "支払い方法", new_card_path
  parent :mypage 
end

crumb :categories do
  link "カテゴリ一覧", categories_path
end

crumb :category do |category|
  @item = Item.find(params[:id])
  link category, "/categories/#{@item.category_grand_child.parent.parent.id}"
  parent :categories
end

crumb :parents do |parents|
  @item = Item.find(params[:id])
  link @item.category_grand_child.parent.parent.name, "/categories/#{@item.category_grand_child.parent.parent.id}"
  parent :categories
end

crumb :child do |child|
  @item = Item.find(params[:id])
  link @item.category_grand_child.parent.name, "/categories/#{@item.category_grand_child.parent.id}"
  parent :parents
end

crumb :grandchild do |grandchild|
  @item = Item.find(params[:id])
  link @item.category_grand_child.name, "/categories/#{@item.category_grand_child.id}"
  parent :child
end

crumb :item do |item|
  link item
  parent :grandchild
end