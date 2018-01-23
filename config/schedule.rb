# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever

# ENV['RAILS_ENV'] = "development"
set :output, "/Users/erickcamacho/Documents/FlatironSchool_103017/Module4/Mod4FinalProject/Mod4Project-Backend/log/whenever.log"
# every 1.day, :at => '3:08 pm' do
#   puts "hello"
#   rake "database:fetch"
# end

every 2.minutes do
  command " echo 'HELLO FROM CRON! :)' "
  runner "League.fetch_api"
end
