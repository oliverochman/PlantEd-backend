class NotificationsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "notifications_#{current_api_v1_user}"
  end

  def unsubscribed
    stop_all_streams
  end
end
