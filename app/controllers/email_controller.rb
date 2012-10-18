class EmailController < ApplicationController

  def sendmail
    post = Post.all  
    user = session[:user]
    SupportEmailer.support_contact(user).deliver
  end
  
  def configmail
   @postId=session[:postid]
   user = User.find(session[:user][:id])
   @count = user.email_count
  end
  
  def saveconfig
      emailstat = EmailStat.new
      emailstat[:postId] = params[:postId]
      emailstat[:counter] = params[:counter]
      emailstat[:call] = params[:call]
      emailstat.save
      redirect_to '/users/dashboard'
  end
end
