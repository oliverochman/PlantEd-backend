module ApplicationCable
  class Connection < ActionCable::Connection::Base

    identified_by :user_id

    def connect
      binding.pry
    end

    def reject_unauthorized_connection
      binding.pry
    end
  end
end
