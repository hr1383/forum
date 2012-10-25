class PostsController < ApplicationController

 def index
    
    puts "--param all-----"
    puts params[:all] =="true"
    puts params
    puts session
    puts "-----end-----"
    if !params[:all].nil? and params[:all] == "true"
      puts "inside all-----"
      @posts = Post.all
    else 
      if !session['user'].nil?
        puts "---user id is -------"
        puts session["user"].to_s
        puts "---end user id--------"
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
    puts @openumvox
    puts @closeumvox
  end
  
  # GET /posts/1
  # GET /posts/1.json
  def show
    @post = Post.find(params[:id])
  end

  # GET /posts/new
  # GET /posts/new.json
  def new
    @post = Post.new
    @post.scenario=[]
    @post.compensation=[]
#    @locations = []
#    @post.category=[]
    unless session[:user].nil?
      @post.user_id=session[:user].id
      puts "setting user id"
    end
    @post.detailinfos.build
    @post.locations.build
    3.times {@post.assets.build}
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @post }
    end
  end

  # GET /posts/1/edit
  def edit
    @post = Post.find(params[:id])
    puts "scenario is "
    puts @post.scenario
    puts "scenario ends"
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(params[:post])
    
    respond_to do |format|
    if @post.save
    session[:postid]=@post.id
    puts session
    puts '------------------'
        format.html { redirect_to :controller => 'email',:action=>'configmail' }
        format.json { render json: @post, status: :created, location: @post }
      else
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

end
