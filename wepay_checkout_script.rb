require 'uri'
require 'json'
require 'net/http'
require 'net/https'
require 'cgi'

headers = {
		   'Content-Type' =>'application/json', 
		   'User-Agent'   => 'Checkout WePay Demo'
		  }
params  = { #parameters required to process a checkout according to the wepay api
		   :account_id => 463624231,
		   :short_description => 'Lego Mindstorms',
		   :type => 'TOYS',
		   :amount => '399.99'
		  }
url = URI.parse('https://stage.wepayapi.com/v2/checkout/create') # URL of the call
call =  Net::HTTP::Post.new(url.path, initheader = headers)
call.add_field('Authorization: Bearer', 'STAGE_df1684a1c7b91f0de51b72e5890891b92d34e47fb3cb48d4dbd8d2a89fa253cc') #Add token generated with your username
call.body = params.to_json

request = Net::HTTP.new(url.host, url.port)
request.read_timeout = 30
request.use_ssl = true

# make http request
response = request.start { |http| http.request(call) }

# response in json
puts JSON.parse(response.body)