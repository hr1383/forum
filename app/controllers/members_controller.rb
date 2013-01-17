class MembersController < ApplicationController

   
  def index
    if session['access_token']
      @face='You are logged in! <a href="facebooks/logout">Logout</a>'
    else
      @face='<a href="users/login">Login</a>'
    end
  end  
 
  
  def filldetails
    
    if session['access_token']
      @graph = Koala::Facebook::API.new(session["access_token"])
      userinfo =  @graph.get_object("me")
      @user = User.new
      @user.firstname = userinfo['first_name']
      @user.lastname = userinfo['last_name']
      @user.username = userinfo['username']
      unless userinfo['location'] == nil
        @user.city = userinfo['location']['name']
      end  
      unless userinfo['birthday'] == nil
        @user.dob =Date.strptime(userinfo['birthday'], '%m/%d/%Y')
      end  
      @user.fbid=userinfo['id']
      @user.email = userinfo['email']
    else
      @user = current_user
    end
  end
  
  def create
    puts params[:user]
    @user1 = User.new(params[:user])
    if @user1.save
      saveduser = User.find_all_by_fbid(params[:user][:fbid])
      unless saveduser.first.nil?
        session[:user] = saveduser.first
      end
      puts "user saved "
      redirect_to "/members/dashboard"
    else
      puts "error while saving user"
    end  
  end

  def signin
    
    puts current_user.nil?
    puts "current user nil"
    puts session[:new_user]
    puts current_user
    
    if !session['access_token'].nil?
      @graph = Koala::Facebook::API.new(session["access_token"])
      userinfo =  @graph.get_object("me")
      fb_id=userinfo['id']
      if fb_id
       userObj = User.find_all_by_fbid(fb_id.to_s)  
        if userObj.first.nil?
          redirect_to '/members/filldetails'
        else
           session[:user] = userObj.first
           redirect_to "/members/dashboard"
           
        end
      end
    elsif !current_user.nil?
      if session[:new_user] != true
        session[:user] = current_user
        puts session[:user].id
        puts "after sigin"
        redirect_to "/members/dashboard"
      else
#        @user = current_user
        redirect_to '/members/filldetails'
      end
    else  
      #    this is logout. its a temp solution
    redirect_to '/welcome'

    end
  end
  
  def dashboard
    @checkinarr = Array.new
    if (session["access_token"])
        graph = Koala::Facebook::API.new(session["access_token"])
        checkinlist = graph.get_connections('me','checkins')
        unless checkinlist.nil?
          checkinlist.each do |checkin|
            place = checkin["place"]
            puts place
            loc = Location.new
            loc.name = place["name"]
            location = place["location"]
            unless location.nil?
              loc.city = location["city"]
              loc.address = location["street"]
              loc.zipcode = location["zip"]
              puts loc
            end
            @checkinarr << loc
          end
        end
    end
    @totalclose = Post.latest_closed
    @totalopen = Post.latest_open
    unless session[:user].nil?
      user = session[:user]
      @isadmin = user.admin
    end
  end
  
  def myprofile
    puts session
    puts session[:user].id
    if !session[:user].nil?
      @user= session[:user]
      puts @user.to_s
      openUmvox=@user.posts.where("status=?","Open")
      closeUmvox=@user.posts.where("status=?","Closed")
      @totalopen = openUmvox.size unless openUmvox.nil?
      @totalclosed = closeUmvox.length unless closeUmvox.nil?
    end
  end
  
  def updateprofile
    if  ! params[:user][:id].blank?
      puts params
      puts params[:user][:id].blank?
      puts params[:user][:id].empty?
     user = User.find(params[:user][:id])
     if user.nil?
       user = User.new
       user.password ="qaumxvo"
     end
    else
      user = User.new
#      not the best way
      user.password ="qaumxvo" 
    end  
    user.firstname=params[:user][:firstname]
     user.username = params[:user][:username]
     user.lastname = params[:user][:lastname]
     user.email = params[:user][:email]
     user.city = params[:user][:city]
     user.state = params[:user][:state]
     user.country = params[:user][:country]
     user.fbid = params[:user][:fbid]
     begin 
      user.save!
      session[:user] = user
     rescue ActiveRecord::RecordNotSaved => e
        user.errors.full_messages
     end
     redirect_to "/members/dashboard"
  end
end
