namespace :forecast do
  desc "Gets updated forecast from apis"
  task enrich: :environment do
    puts "start"
    StormGlassApiCallJob.perform_now
    puts 'Finished Stormglass'

    OpenweathermapJob.perform_now
    puts 'Finished Openweathermap'
  end
end
