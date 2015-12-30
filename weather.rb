require 'rest-client'
require 'json'

city = ''

api_key = '5a2e31a4540b2e48e2eb545de2495c70'

puts "Enter a city"

while city !~ /quit/
  
  city = gets.chomp
  puts "Weather: "
   
  api_url = "api.openweathermap.org/data/2.5/forecast/city?q=#{city}&APPID=#{api_key}"
  weather = RestClient.get(api_url)
  weather_data = JSON.parse(weather)
  
  begin
    puts weather_data['list'][0]['weather'][0]['description']
  rescue Exception => e
    puts "Enter a city"
  end
end