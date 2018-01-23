namespace :my_namespace do
  desc "Rake task to update fixtures and league table"
  task :my_task => :environment do
    puts 'Updating'
    League.fetch_api
    puts "#{Time.now} — Success!"
  end
end
