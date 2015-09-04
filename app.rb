require 'sinatra'
require 'mail'
require "mailer.rb"

def mailer
	puts "MAILER SAYS"
	puts @email
	puts @text

	options = { :address              => "mail.classwork.mike-lucek.com",
	            :port                 => 587,
	            :user_name            => 'test@classwork.mike-lucek.com',
	            :password             => 'tung99tung99',
	            :authentication       => 'plain',
	            :enable_starttls_auto => false  }


	Mail.defaults do
	  delivery_method :smtp, options
	end

	email = @email
	text = @text

	mail = Mail.new do
	  from    'test@classwork.mikelucek.com'
	  to      email
	  subject 'This is a test email'
	  body    text
	end

	mail.to_s

	mail.deliver
end





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

