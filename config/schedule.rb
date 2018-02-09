ENV['RAILS_ENV'] = "development"

every 1.minute do
  runner 'UserPlant.all.each {|plant| plant.send_notification}'
  #system "cd /Users/thomas/CraftAcademy/student_work_18/PlantEd-backend && bundle exec bin/rails runner -e development 'UserPlant.all.each {|plant| plant.send_notification}'"
end

