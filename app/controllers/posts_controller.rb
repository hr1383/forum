class PostsController < ApplicationController

  before_filter :authenticate1_user , :only =>[:index,:new,:destroy]
  before_filter :set_meta_tag
  
 def index
   @meta_title = "List of All Voxes"
   @meta_description = " The voxes and complaints of the user"
    if !params[:all].nil? and params[:all] == "true"
      @posts = Post.all
    else 
      @posts = Post.find_all_by_user_id(session["user"].id.to_s)
    end
    @openumvox, @closeumvox = @posts.partition { |p| p.status == 'Open' }
  end
  
  # GET /posts/1
  # GET /posts/1.json
  def show
    @post = Post.find_by_parameterize(params[:id])
    if @post.nil?
      @post=Post.find(params[:id])
    end
    @meta_title = @post.question
    @meta_description = @post.description
  end

  # GET /posts/new
  # GET /posts/new.json
  def new
    @meta_title = "Create a new Vox"
   @meta_description = "Express the concern, complaint or appreciate the service"
    @post = Post.new
    @post.scenario=[]
    @post.compensation=[]
    unless session[:user].nil?
      @post.user_id=session[:user].id
    end
    @post.detailinfo = Detailinfo.new
    @post.build_location
    @category = Category.all.sort! { |a,b| a.name.downcase <=> b.name.downcase }
     respond_to do |format|
      format.html
      format.json { render json: @post }
    end
  end

  # GET /posts/1/edit
  def edit
    @post = Post.find_by_parameterize(params[:id])
    @isadmin=User.find(session[:user].id).admin
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(params[:post])
    @post.parameterize = @post.question.parameterize
    unless params[:post][:firstname].nil?
      unless verify_recaptcha
        @error_message = "Captcha didnt't match. Please enter again"
        render action: "singlevox" 
        return
      end
      u = User.find_by_email(params[:post][:email])
      unless u.nil?
        @error_message = "User already registered with the email."
        render action: "singlevox" 
        return
      else
        u = User.new(params[:post])
        u.username = u.email.split('@')[0]
      end
      if !u.save(validate: false)
          @error_message = "Error while saving, check user details."
          render action: "singlevox" 
          return
      end
      @post.user_id = u.id
    end
    respond_to do |format|
    
    if @post.save
      session[:postid]=@post.id
      Thread.new{SupportEmailer.createvox(@post,User.find(@post.user_id)).deliver}
      format.html {redirect_to :controller=>'posts',:action=>"next"}
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
        format.html { redirect_to "/members/dashboard"}
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
    # @post = Post.find(params[:id])
 #    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_url }
      format.json { head :ok }
    end
  end
  
  def search
     @location_posts = Post.joins(:location).where("name like ? or category like ?", "%#{params[:search]}%","%#{params[:search]}%") 
      @voxes = Post.search_description(params[:search])
      if @voxes.any?
       @voxes.merge(@location_posts)
     elsif
       @voxes=@location_posts
     end
  end
  
  def resolvevox
     @post = Post.find_by_parameterize(params[:name])
  end
  
  def singlevox
    @post = Post.new
    @post.scenario=[]
    @post.compensation=[]
    unless session[:user].nil?
      @post.user_id=session[:user].id
    end
    @post.detailinfo = Detailinfo.new
    @post.build_location
    @category = Category.all.sort! { |a,b| a.name.downcase <=> b.name.downcase }
  end
end
