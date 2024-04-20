require 'httparty'
require 'json'

def fetch_events(api_key, location)
  url = "https://www.eventbriteapi.com/v3/events/search/?token=#{api_key}&location.address=#{location}&sort_by=date"
  response = HTTParty.get(url)
  JSON.parse(response.body)
end

def display_events(events)
  events['events'].each do |event|
    name = event['name']['text']
    venue = event['venue']['name']
    start_time = event['start']['local']
    puts "Event: #{name}"
    puts "Venue: #{venue}"
    puts "Start Time: #{start_time}"
    puts "--------------------------------------"
  end
end

# Obtain your API key from Eventbrite
api_key = 'PEZIGGDKU2G2ZMMYCFEJ'

# Specify the location for which you want to find events
location = 'Memphis'

# Fetch events from Eventbrite API
events = fetch_events(api_key, location)

# Display information about each event
display_events(events)
