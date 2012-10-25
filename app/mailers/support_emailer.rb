class SupportEmailer < ActionMailer::Base
default :from => "hrsht.rastogi13@gmail.com"

def support_contact(user)
  mail(:to => user.emaild, :subject => "Registered")
end

def sendmail(post,location,user)
  @post=post
  @location = location
  @user=user
  puts @location.email
   mail(:to => @location.email, :subject => "Registered")
end  
end
