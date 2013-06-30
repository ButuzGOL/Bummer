module ApplicationHelper
  def full_title(page_title)
    base_title = 'Bummer'
    if page_title.empty?
      base_title
    else
      '#{base_title} | #{page_title}'
    end
  end

  def is_divide_site_width?
    ['devise/registrations', 'passwords', 'sessions'].include?(params[:controller])
  end

  def is_divide_site_width_two_third?
    params[:controller] == 'high_voltage/pages' && ['help'].include?(params[:id])
  end

  def divide_site_class
    if is_divide_site_width?
      'half'
    elsif is_divide_site_width_two_third?
      'two-third'
    end        
  end
end
