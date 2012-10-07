class EmailController < ApplicationController

  def sendmail
    post = Post.all  
    user = session[:user]
    SupportEmailer.support_contact(user).deliver
  end
  
end
