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
