require 'yahoo_weatherman'

def get_location(location)
	client = Weatherman::Client.new
	client.lookup_by_location(location)
end

puts "What is your ZIP code?"
location = gets.chomp

weather = get_location(location)

today = Time.now.strftime('%w').to_i

weather.forecasts.each do |forecast|

day = forecast['date']

weekday = day.strftime('%w').to_i

if weekday == today
	dayName = 'Today'
elsif weekday == today + 1
	dayName = 'Tomorrow'
else
	dayName = day.strftime('%A')
end

puts 'Hey, sucka! Here\'s the forcast for ' + dayName + '. I pity the fool that doesn\'t bring a jacket. It\'s going to be ' + 
forecast['text'].downcase + ' with a low of ' + 
forecast['low'].to_s + ' and a high of ' + 
forecast['high'].to_s + '. Take it from me, Mr. T'
end

