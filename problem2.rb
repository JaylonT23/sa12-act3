require 'httparty'
require 'json'

def fetch_exchange_rate(api_key, source_currency, target_currency)
  url = "https://v6.exchangeratesapi.io/latest?access_key=#{api_key}&base=#{source_currency}&symbols=#{target_currency}"
  response = HTTParty.get(url)
  exchange_rate_data = JSON.parse(response.body)
  exchange_rate_data['rates'][target_currency]
end

def convert_currency(amount, exchange_rate)
  amount * exchange_rate
end

# Obtain your API key from the ExchangeRate-API service
api_key = '72445685-a2f3-40c2-bfdc-91d30651c800'

# Specify the source and target currencies
source_currency = 'USD'
target_currency = 'EUR'

# Specify the amount to convert
amount_to_convert = 100

# Fetch the exchange rate from the API
exchange_rate = fetch_exchange_rate(api_key, source_currency, target_currency)

# Convert the amount from the source to the target currency
converted_amount = convert_currency(amount_to_convert, exchange_rate)

# Output the result
puts "#{amount_to_convert} #{source_currency} is equivalent to #{converted_amount.round(2)} #{target_currency}"
