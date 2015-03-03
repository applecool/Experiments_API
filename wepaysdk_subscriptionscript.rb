# download the Ruby SDK at https://github.com/wepay/ruby-sdk
require 'wepay'

# credentials
client_id = ''
client_secret = ''
access_token = 'STAGE_df1684a1c7b91f0de51b72e5890891b92d34e47fb3cb48d4dbd8d2a89fa253cc'

wepay = WePay.new(client_id, client_secret)
response = wepay.call('/preapproval/create', access_token, {
	:account_id => 461624321,
	:period => 'monthly',
	:end_time => '2015-12-15',
	:amount => '10.99',
	:short_description => 'Subscription to the fitness app.',
	:auto_recur => true #this should be true for all subscriptions
})

puts response

#redirect user to response['checkout_uri']	