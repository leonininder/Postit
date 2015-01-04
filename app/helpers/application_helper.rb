module ApplicationHelper
  def url_fix(str)
    str.starts_with?('http://') ? str : "http://#{str.downcase}"
  end
  def set_time(time)
      time.strftime("%A, %B %e %Y at %I:%M %P")
  end
end
