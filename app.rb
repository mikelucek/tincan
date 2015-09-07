require 'sinatra'
require 'mail'
require "./mailer.rb"


get "/" do 
	erb :home, :layout => false
end

get "/info" do
	erb :info
end

get "/preorder" do
	erb :preorder

end

post "/mailer" do
	# puts "mailer got"
	# puts params.inspect
	@text=params[:text]
	@email=params[:email]
	mailer_proc
	erb :confirm
end

get "/contact" do
	erb :contact
end

