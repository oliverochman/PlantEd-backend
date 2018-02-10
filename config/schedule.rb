ENV['RAILS_ENV'] = "development"

every 1.minute do
  runner 'UserPlant.all.each {|plant| plant.send_notification}'
end

