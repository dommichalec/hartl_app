module ApplicationHelper

  # renders the full title via <% provide(:title, "Something") %>
  def full_title(title)
    base_title = "Ruby on Rails Tutorial"
    if title.empty?
      base_title
    else
      "#{title} | Ruby on Rails Tutorial"
    end
  end
end
