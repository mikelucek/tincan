
def mailer_proc

	puts "MAILER SAYS"
	puts @email
	puts @text
	@mail_to = ENV['EMAIL']

	options = { :address              => "mail.classwork.mike-lucek.com",
	            :port                 => 587,
	            :user_name            => 'test@classwork.mike-lucek.com',
	            :password             => ENV["PASSWORD"],
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