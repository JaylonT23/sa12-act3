require 'httparty'
require 'json'

def fetch_weather_data(api_key, city)
  url = "http://api.openweathermap.org/data/2.5/weather?q=#{city}&appid=#{api_key}&units=metric"
  response = HTTParty.get(url)
  JSON.parse(response.body)
end

def calculate_average_temperature(weather_data)
  temperatures = weather_data['hourly'].map { |hour| hour['temp'] }
  average_temperature = temperatures.sum / temperatures.size.to_f
  average_temperature.round(2)
end

# Specify your OpenWeatherMap API key and the city for which you want weather data
api_key = 'bd5e378503939ddaee76f12ad7a97608'
city = 'London'

# Fetch current weather data from OpenWeatherMap API
weather_data = fetch_weather_data(api_key, city)

# Display current weather data
puts "Current Temperature in #{city}: #{weather_data['main']['temp']}°C"
puts "Current Humidity in #{city}: #{weather_data['main']['humidity']}%"
puts "Weather Condition in #{city}: #{weather_data['weather'][0]['description']}"

# Calculate average temperature
average_temperature = calculate_average_temperature(weather_data)
puts "Average Temperature in #{city} over 24 hours: #{average_temperature}°C"
