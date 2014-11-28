module ArticlesHelper
  def category_is_active(category_id)
    if params[:action] == 'index' and category_id.to_s == 'index'
      "active"
    elsif params[:id] == category_id.to_s
      "active"
    end
  end
end
