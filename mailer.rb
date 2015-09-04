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
	  from    email
	  to      'michael.s.lucek@gmail.com'
	  subject 'TinCan Contact form'
	  body    text
	end

	mail.to_s

	mail.deliver
end