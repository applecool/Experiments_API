#simplified version
# download the Ruby SDK at https://github.com/wepay/ruby-sdk or install the sdk by running gem install wepay in terminal
require 'wepay'

# credentials
client_id = ''
client_secret = ''
access_token = 'STAGE_df1684a1c7b91f0de51b72e5890891b92d34e47fb3cb48d4dbd8d2a89fa253cc'

wepay = WePay.new(client_id, client_secret)
response = wepay.call('/checkout/create', access_token, {
	:account_id => 463624231,
	:short_description => 'Lego Mindstorms',
	:type => 'TOYS',
	:amount => '399.99',
	:redirect_uri => 'url of a website'
	
})

puts response

#redirect user to response['checkout_uri']