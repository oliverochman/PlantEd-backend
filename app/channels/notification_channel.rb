class NotificationChannel < ApplicationCable::Channel
  def subscribed
    if self.params[:user_id].nil?
      code = self.connection.connection_identifier
    else
      code = self.params[:user_id]
    end
    stream_from "notifications_#{code}"
    binding.pry
  end

  def unsubscribed
    stop_all_streams
  end
end
