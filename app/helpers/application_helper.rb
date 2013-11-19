module ApplicationHelper
  def fix_url (url)
    url.starts_with?('http://') ? url : "http://#{url}"
  end

  def display_datetime(dt)
    dt = dt.in_time_zone(current_user.time_zone) if logged_in? and current_user.time_zone
    dt.strftime("%m/%d/%Y %l:%M %p %Z")
  end

  def count_votes(arr)
    up_vote = arr.select {|v| v.vote }
    down_vote = arr.select {|v| !v.vote }
    up_vote.size - down_vote.size
  end

end
