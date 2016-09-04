module ApplicationHelper

  # renders the full title via <% provide(:title, "Something") %>
  def full_title(title)
    "#{title} | Ruby on Rails Tutorial"
  end
end
