require 'sinatra'
require 'mail'
#require "./mailer.rb"

def mailer_proc
	puts "MAILER SAYS"
	puts @email
	puts @text

	options = { :address              => "mail.classwork.mike-lucek.com",
	            :port                 => 587,
	            :user_name            => 'test@classwork.mike-lucek.com',
	            :password             => 'fake password',
	            :authentication       => 'plain',
	            :enable_starttls_auto => false  }


	Mail.defaults do
	  delivery_method :smtp, options
	end

	email = "email inquiry from " + @email
	text = @text

	mail = Mail.new do
	  from    'test@classwork.mike-lucek.com'
	  to      'FAKE@gmail.com'
	  subject email
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
	erb :preorder

end

post "/mailer" do
	# puts "mailer got"
	# puts params.inspect
	@text=params[:text]
	@email=params[:email]
	# erb :mail
	mailer_proc
end

get "/contact" do
	erb :contact
end

