module ApplicationHelper
  def page_title title
    content_tag(:h1, title, class: :title)
  end

  def error_block error
    content_tag(:div, error, class: 'error-block')
  end

  def br
    sanitize "<br />"
  end
end
