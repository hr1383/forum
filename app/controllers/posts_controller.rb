class PostsController < ApplicationController

  before_filter :authenticate1_user , :only =>[:index,:new,:destroy,:browse]
 def index
    
    if !params[:all].nil? and params[:all] == "true"
      @posts = Post.all
    else 
      if !session['user'].nil?
        @posts = Post.find_all_by_user_id(session["user"].id.to_s)
      else
        puts "ERR session expired"
      end
    end
    @openumvox = Array.new
    @closeumvox = Array.new
    @posts.each do |post|
      if !post.status.nil? and post.status == 'Open'
        @openumvox.push(post)
      else
        @closeumvox.push(post)
      end
    end
  end
  
  # GET /posts/1
  # GET /posts/1.json
  def show
    @post = Post.find(params[:id])
  end

  # GET /posts/new
  # GET /posts/new.json
  def new
    puts params
    @post = Post.new
    @post.scenario=[]
    @post.compensation=[]
    unless session[:user].nil?
      @post.user_id=session[:user].id
      puts "setting user id"
    end
    @post.detailinfos.build
    unless params[:name].nil? and params[:addr].nil?
      loc = Location.new
      loc.address = params[:addr].nil? ? "" :params[:addr]
      loc.name = params[:name].nil? ? "" :params[:name]
      loc.zipcode = params[:zip].nil? ? "" : params[:zip]
      loc.city = params[:city].nil? ? "" : params[:city]
      @post.location=loc
      @haslocation=true
    else
      @haslocation=false
      @post.build_location
    end
    3.times {@post.assets.build}
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @post }
    end
  end

  # GET /posts/1/edit
  def edit
    @post = Post.find(params[:id])
    @isadmin=User.find(session[:user].id).admin
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(params[:post])
    
    respond_to do |format|
    if @post.save
    session[:postid]=@post.id
    Thread.new{SupportEmailer.createvox(@post,User.find(@post.user_id)).deliver}
    format.html {redirect_to :controller=>'members',:action=>"dashboard"}
    else
      if @post.scenario.nil?
        @post.scenario=[]
      end
      if @post.compensation.nil?
        @post.compensation=[]
      end  
        format.html { render action: "new" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /posts/1
  # PUT /posts/1.json
  def update
    @post = Post.find(params[:id])
    respond_to do |format|
      if @post.update_attributes(params[:post])
        @post.assets.each do |asset|
          asset.save
        end
        format.html { redirect_to @post, notice: 'post was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_url }
      format.json { head :ok }
    end
  end
  
  def search
      @search = Post.search do
        fulltext params[:search]
      end
      @posts = @search.results
  end
  

  def browse
    unless params[:type].nil?
      #:type is always location
      if params[:type] == 'category'
        locations = Location.find_all_by_category(params[:search]) 
      else
        @search = Location.search do
         fulltext params[:search]
        end
        locations = @search.results
      end
      @returnsearch =true
     end
     
    @locationGroupByName={}
    unless locations.nil?
     locations.each do |location|
       if @locationGroupByName[location.address].nil?
         @locationGroupByName[location.address] = [1,location.category,location.name]
       else
         someObj = @locationGroupByName[location.address]
         someObj[0] = someObj[0].to_i+1
         @locationGroupByName[location.address] = someObj
       end
     end
   end
  end
  
  def list
    locations = Location.find_all_by_address_and_name(params[:address],params[:name])
#    locations cannot be nil
    @posts = Array.new
    locations.each do |location|
      @posts << location.post
    end
  end
end
