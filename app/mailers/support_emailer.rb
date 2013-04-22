class SupportEmailer < ActionMailer::Base
default :from => "support@umvox.com"

def support_contact(user)
  mail(:to => user.emaild, :subject => "Registered")
end

def sendmail(post,location,user)
  @post=post
  @location = location
  @user=user
  puts "sendimail"
#  attachments.inline['logo'] = File.read("#{Rails.root.to_s + '/app/assets/images/logo.png'}")
   mail(:to => @location.email, :subject => "You received an opinion on Umvox")
end  

def createvox(post,user)
  @post=post
  @user=user
  puts "sending create vox"
#  attachments.inline['logo'] = File.read("#{Rails.root.to_s + '/app/assets/images/logo.png'}")
   mail(:to => user.email, :subject => "Thanks for creating vox")
end 

def contactus(username,email,subj,message)
  @username=username
  @email = email
  @subj=subj
  @message = message
  puts message
  mail(:to => "harshit@gogii.net", :subject => "Mail from support")
end
end
