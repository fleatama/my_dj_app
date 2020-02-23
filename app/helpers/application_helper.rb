module ApplicationHelper
  def full_title(page_title = '')
    base_title = "MyTube APP"
    if page_title.empty?
      base_title
    else
      page_tite + " | " + base_title
    end
  end
end
