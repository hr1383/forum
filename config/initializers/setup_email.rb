ActionMailer::Base.smtp_settings = {  
      :address              => "smtpout.secureserver.net",  
      :port                 => 80,  
      :domain               => "www.umvox.com",  
     :user_name            => ENV[GMAIL_PASSWORD],
      :password             => ENV[GMAIL_USERNAME],
      :authentication       => "plain",  
      :enable_starttls_auto => true  
   }