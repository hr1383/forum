class SessionsController < Devise::SessionsController
  before_filter :already_signed , :only =>[:new]
  def new
    super
    puts "Inside session new"
     session[:new_user] = false
  end
  
  def create
    super
        puts "Inside session create"
    session[:new_user] = false
  end
  
  def destroy
    super
    puts "inside destroy"
    session[:user] = nil
  end
  
  protected
    def already_signed
      if user_signed_in? || session[:user] !=nil
        redirect_to (root_path) and return
    end
    end
end
