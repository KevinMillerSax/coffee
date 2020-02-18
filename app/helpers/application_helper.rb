module ApplicationHelper

  def custom_title(page_title = '')
    base_title = "I Love Coffee"
    if page_title.empty?
      page_title = base_title
    else
      page_title
    end
  end
end
