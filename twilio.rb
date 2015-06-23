require 'rubygems' # not necessary with ruby 1.9 but included for completeness
require 'twilio-ruby'

# put your own credentials here
account_sid = 'AC8b02c87ccb73a64fc9a3dd588571c195'
auth_token = '826d85e519167ee18af6c7ab0dc86fba'

puts 'Start authentication'

# set up a client to talk to the Twilio REST API
@client = Twilio::REST::Client.new account_sid, auth_token

puts "Enter message"
msg = gets.chomp
puts "Enter destination number"
dest = gets.chomp

begin
	message = @client.account.messages.create(:body => msg, :to => dest, :from => '+13235270659')
rescue Twilio::REST::RequestError => e
	puts e.message
end