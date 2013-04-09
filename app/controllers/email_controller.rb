class EmailController < ApplicationController

#  before_filter :authenticate1_user ,:all
  def sendmail
#    emailStatList = EmailStat.find(:all,:conditions=>["(DATE(lastsent) < ? or lastsent IS NULL) and counter > 0", 1.from_now.to_date - 1])
   @successEmailList =[]
    params[:arr].each do |p|
       map = p[1]
       postid=map[:postid]
         post = Post.find(postid)
       if !map[:email].eql?(map[:oldemail])
         post.location.email=map[:email]
         post.location.save
       end  
       puts map[:email]!= ''
       puts 1 == map[:isSend]
       if map[:email] != '' and "1" == map[:isSend]
         puts "inside the check"
#         emailstat = EmailStat.where(:postId=>map[:postid]).first
         SupportEmailer.sendmail(post,post.location,User.find(post.user_id)).deliver
#          emailstat[:counter] = emailstat.counter-1
#          emailstat[:lastsent] = Time.now()
#          emailstat.save
          @successEmailList.push(post.location.email)
       end   
       end
   
    @email_stats = EmailStat.where("counter > 0")
    @postlist = Post.find_all_by_posttype('Question')
    render "email/index"    
    
  end
  
  def configmail
   @postId=session[:postid]
   user = User.find(session[:user][:id])
   @count = user.email_count
   @postType= Post.find(@postId).posttype
  end
  
  def saveconfig
      emailstat = EmailStat.new
      emailstat[:postId] = params[:postId]
      emailstat[:counter] = params[:counter]
      emailstat[:call] = params[:call]
      emailstat.save
      redirect_to '/members/dashboard'
  end
  
  def view
    @email_stats = EmailStat.where("counter > 0")
    @postlist = Post.find_all_by_posttype('Question')
    render "email/index"
  end
end
