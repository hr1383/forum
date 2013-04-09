class SupportEmailer < ActionMailer::Base
default :from => "hrsht.rastogi13@gmail.com"

def support_contact(user)
  mail(:to => user.emaild, :subject => "Registered")
end

def sendmail(post,location,user)
  @post=post
  @location = location
  @user=user
  puts "sendimail"
  attachments.inline['logo'] = File.read("#{Rails.root.to_s + '/app/assets/images/logo.png'}")
   mail(:to => @location.email, :subject => "You received an opinion on Umvox")
end  

def createvox(post,user)
  @post=post
  @user=user
  if Rails.env.production?
#    @url = "<a href=\"http://enigmatic-badlands-8436.herokuapp.com/posts/#{post.id}\">"
   end
  attachments.inline['logo'] = File.read("#{Rails.root.to_s + '/app/assets/images/logo.png'}")
   mail(:to => user.email, :subject => "Thanks for creating vox")
end 

def contactus(username,email,subj,message)
  @username=username
  @email = email
  @subj=subj
  puts @message
  mail(:to => "harshit@gogii.net", :subject => "Mail from support")
end
end
