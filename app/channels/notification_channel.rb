class NotificationChannel < ApplicationCable::Channel
  def subscribed
    reject unless self.params[:user_id]
    code = self.params[:user_id]
    stream_from "notifications_#{code}"
  end

  def unsubscribed
    stop_all_streams
  end
end
