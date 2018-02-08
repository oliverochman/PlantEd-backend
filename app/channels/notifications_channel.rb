class NotificationsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "notifications:#{current_api_v1_user.id}"
  end

  def unsubscribed
    stop_all_streams
  end
end
