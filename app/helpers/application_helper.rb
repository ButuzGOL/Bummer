module ApplicationHelper
  # Returns the full title on a per-page basis.
  def full_title(page_title)
    base_title = 'Bummer'
    if page_title.empty?
      base_title
    else
      '#{base_title} | #{page_title}'
    end
  end

  # Return is site width divide
  def is_divide_site_width?
    ['devise/registrations', 'sessions'].include?(params[:controller])
  end
end
