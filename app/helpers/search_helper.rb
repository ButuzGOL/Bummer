module SearchHelper
  def is_search_path?
    params[:controller] == 'search'
  end
end
