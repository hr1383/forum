class SupportEmailer < ActionMailer::Base
default :from => "hrsht.rastogi13@gmail.com"

def support_contact(user)
  mail(:to => user.emaild, :subject => "Registered")
end

def sendmail(post,location,user)
  @post=post
  @location = location
  @user=user
   mail(:to => @location.email, :subject => "Registered")
end  

def createvox(post,user)
  @post=post
  @user=user
   mail(:to => user.email, :subject => "Thanks for creating vox")
end 

def contactus(username,email,subj,message)
  @username=username
  @email = email
  @subj=subj
  @message = message
  puts 'SENDING MAIL'
  puts @username
  puts @email
  puts @subj
  puts @message
  mail(:to => "harshit@gogii.net", :subject => "Mail from support")
end
end
