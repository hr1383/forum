class SessionsController < Devise::SessionsController
  before_filter :already_signed , :only =>[:new]
  def new
    super
   
     session[:new_user] = false
     session[:user] = current_user
  end
  
  def create
    super
        
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
