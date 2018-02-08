class BroadcastNotificationJob < ApplicationJob
  queue_as :default

  def perform(data)
    ActionCable.server.broadcast "notifications_#{data[:user_id]}", data
  end
end