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
# crumb :child do |child|
#   link child
#   parent :category
# end

#       - parent.children.each do |child|
#         link child.name, "#"
#       end
#   parent :categories
# end
# crumb :category 
# category.each do |parent|
#     parent.name
#   parent :root
# end
# crumb :projects do
#   link "Projects", projects_path
# end

# crumb :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).