namespace :notifications do
  desc "TODO"
  task send: :environment do
    UserPlant.all.each do |plant|
      plant.send_notification
    end
  end

end
