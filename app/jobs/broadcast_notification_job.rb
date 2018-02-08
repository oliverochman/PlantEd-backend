class BroadcastNotificationJob < ActiveJob::Base
  queue_as :default

  def perform(data)
    #binding.pry
    #ActionCable.server.broadcast("notifications_#{data[:user_id]}", data)
    #ActionCable.server.broadcast("notifications_2", "Hello World")
    ActionCable.server.broadcast \
  "notifications_2", {sent_by: 'Paul', body: 'This is a cool chat app.'}
  end
end