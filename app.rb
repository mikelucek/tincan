require 'sinatra'
require 'mail'


get "/" do 
	erb :home
end

get "/info" do
	erb :info
end

post "/preorder" do
	preorder

end

post "/mailer" do
	mailer
	# puts "mailer got"
	# puts params.inspect
	@text=params[:text]
	@email=params[:email]
	# erb :mail
end

get "/contact" do
	erb :contact
end

