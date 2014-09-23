require 'securerandom'

class MembersController < ApplicationController

  #   before_filter :authenticate1_user , :only =>[:dashboard]

  def filldetails
    
    if session['access_token']
      @graph = Koala::Facebook::API.new(session["access_token"])
      userinfo =  @graph.get_object("me")
      fb_id=userinfo['id']
      userObj = User.find_by_fbid(fb_id.to_s)
      if userObj.nil?
        @user = userObj
      end
    else
      @user = current_user
    end
    render layout: "headerless"
  end
  
  def create
    @user1 = User.new(params[:user])
    
    if @user1.save
      saveduser = User.find_by_fbid(params[:user][:fbid])
      unless saveduser.nil?
        session[:user] = saveduser
      end
      redirect_to "/members/dashboard"
    else
      puts "error while saving user"
    end  
  end

  def signin
    if !session['access_token'].nil?
      graph = Koala::Facebook::API.new(session["access_token"])      
      userinfo =  graph.get_object("me")
      fb_id=userinfo['id']
      userObj = User.find_by_fbid(fb_id.to_s) 
      if userObj.nil? && !userinfo['email'].nil?
        userObj = User.find_by_email(userinfo['email']) 
      end
      if userObj.nil?
        city = ""
        unless userinfo['location'] == nil
          city = userinfo['location']['name']
        end 
        puts userinfo
        @user = User.new(:firstname=>userinfo['first_name'], :lastname=>userinfo['last_name'],
        :username=>userinfo['username'], :fbid=>userinfo['id'],:email=>userinfo['email'],:city=>city)
        @user.password = SecureRandom.hex(12)
        begin
          @user.save!
          userObj = @user
          UmvoxEmailer.welcome(@user).deliver
        rescue Exception => e
            puts "caught exception #{e}! ohnoes!"
        end       
         
      end
      session[:user] = userObj
      current_user= userObj
      redirect_to "/members/dashboard"
    elsif !current_user.nil?
      if session[:new_user] != true
        session[:user] = current_user
        redirect_to "/members/dashboard"
      else
        redirect_to '/members/filldetails'
      end
    else  
      #    this is logout. its a temp solution
      redirect_to '/welcome'
    end
  end
  
  def dashboard
    if session[:user].nil?
      session[:user] = current_user
    end
    @myvoxes = Post.find_all_by_user_id(session[:user].id)
    if session[:user].admin
      @totalclose = Post.closed
      @totalopen = Post.open
    else
      @totalclose = Post.latest_closed
      @totalopen = Post.latest_open
    end
  end
      
  
  def show
    @user= User.find(params[:id])
  end
  
  def updateprofile
    if  !params[:user][:id].blank?
      @user = User.find(params[:user][:id])
    else 
      @user = User.find(params[:user][:fbid])
    end
    
    if @user.subscribe_token.nil?
      @user.subscribe_token = loop do
        random_token = SecureRandom.urlsafe_base64
        break random_token unless User.where(subscribe_token: random_token).exists?
      end  
    end
    begin 
      @user.update_attributes(params[:user])
      session[:user] = @user
      redirect_to "/members/dashboard"
    rescue ActiveRecord::RecordNotSaved => e
      @user.errors.full_messages << "Problem while saving records."
      redirect_to "/members/filldetails"
    rescue ActiveRecord::RecordNotUnique => e1
      @user.errors.full_messages << "Username already taken."
      redirect_to "/members/filldetails"
    end
     
  end
  
  def contactus
    @user=session[:user]
  end
  
  def userp
    user = User.find_by_username(params[:username])
    value= Hash.new
    if !user.nil?
      value["present"] ="f"
    else
      value["present"] ="t"
    end
    respond_to do |format|
      format.json { render json: value }
    end
  end
  def support
    if verify_recaptcha
      Thread.new{SupportEmailer.contactus(params[:name],params[:email],params[:subject],params[:message])}
    else
      build_resource
      flash[:alert] = "There was an error with the recaptcha code below. Please re-enter the code and click submit."
      render_with_scope :contactus
    end
    redirect_to "/members/dashboard"
  end
  
  def unsubscribe
    
  end
  
  def unconfirm
    user = User.find_by_subscribe_token(params[:token])
    unless user.nil?
      user.subscribe=0
      user.save
      session[:user] = user
      current_user= user
    end
    
    redirect_to "/members/dashboard"
  end
end
