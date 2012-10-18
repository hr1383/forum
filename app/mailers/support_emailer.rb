class SupportEmailer < ActionMailer::Base
default :from => "hrsht.rastogi13@gmail.com"

def support_contact(user)
  mail(:to => user.emaild, :subject => "Registered")
end

end
