ActionMailer::Base.smtp_settings = {  
      :address              => "smtp.gmail.com",  
      :port                 => 587,  
      :domain               => "gmail.com",  
     :user_name            => "hrsht.rastogi@gmail.com", #Your user name
      :password             => "monica02", # Your password
      :authentication       => "plain",  
      :enable_starttls_auto => true  
   }