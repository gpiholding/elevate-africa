module ApplicationHelper
  def valid_admin?
    current_user && current_user.is_admin?
  end

  def get_url(video_link)

  end
end
