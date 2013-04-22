ActionMailer::Base.smtp_settings = {  
      :address              => "smtpout.secureserver.net",  
      :port                 => 80,  
      :domain               => "www.umvox.com",  
     :user_name            => "support@umvox.com",
      :password             => "Complaints1",
      :authentication       => "plain",  
      :enable_starttls_auto => true  
   }