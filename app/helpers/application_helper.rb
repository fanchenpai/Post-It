module ApplicationHelper
  def fix_url (url)
    url.starts_with?('http://') ? url : "http://#{url}"
  end

  def display_datetime(dt)
    dt.strftime("%m/%d/%Y %l:%M %p %Z")
  end
end
