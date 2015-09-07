require 'sinatra'
require 'mail'
#require "./mailer.rb"

def mailer_proc
	puts "MAILER SAYS"
	puts @email
	puts @text
	@mail_to = ENV['EMAIL']

	# having trouble passing ENV to options...?
	# @password = ENV['PASSWORD']
	# password =@password

	options = { :address              => "mail.classwork.mike-lucek.com",
	            :port                 => 587,
	            :user_name            => 'test@classwork.mike-lucek.com',
	            :password             => "FAKE",
	            :authentication       => 'plain',
	            :enable_starttls_auto => false  }


	Mail.defaults do
	  delivery_method :smtp, options
	end

	email = "email inquiry from " + @email
	if @text.nil?
		text = "Sign me up for preordering"
	else
		text = @text
	end

	mailto = @mail_to
	mail = Mail.new do
	  from    'test@classwork.mike-lucek.com'
	  to      mailto
	  subject email
	  body    text
	end

	mail.to_s

	mail.deliver
end

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
	# erb :mail
	mailer_proc
	erb :confirm
end

get "/contact" do
	erb :contact
end

