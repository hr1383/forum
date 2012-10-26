class EmailController < ApplicationController

  def sendmail
    emailStatList = EmailStat.find(:all,:conditions=>["(DATE(lastsent) < ? or lastsent IS NULL) and counter > 0", 1.from_now.to_date - 1])
    @successEmailList =[]
    unless emailStatList.nil?
      emailStatList.each do |email|
        post = Post.find(email.postId)
       if post.posttype != 'Compliment' 
        unless post.locations[0].email.nil? 
          puts "sending email "
          puts post.locations[0].email
          SupportEmailer.sendmail(post,post.locations[0],User.find(post.user_id)).deliver
          email[:counter] = email.counter-1
          email[:lastsent] = Time.now()
          email.save
          @successEmailList.push(post.locations[0].email)
        end
       end
      end
    end
    @emailStatList = EmailStat.where("counter > 0")
    render "email/index"    
    
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
  
  def viewmail
    @emailStatList = EmailStat.where("counter > 0")
    render "email/index"
  end
end
