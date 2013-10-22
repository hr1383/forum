ActionMailer::Base.smtp_settings = {  
      :address              => "smtpout.secureserver.net",  
      :port                 => 80,  
      :domain               => "www.umvox.com",  
     :user_name            => ENV["GMAIL_USERNAME"],
      :password             => ENV["GMAIL_PASSWORD"],
      :authentication       => "plain",  
      :enable_starttls_auto => true  
   }